import Foundation

class APIClient {

    func request<T: Codable>(apiRouter: APIRouter) async throws -> T {

        var components = URLComponents()
        components.host = apiRouter.host
        components.scheme = apiRouter.scheme
        components.path = apiRouter.path
        components.queryItems = {
            var parameters = apiRouter.parameters

            if apiRouter.isNeedAuth {
                parameters.append(
                    URLQueryItem(name: "key", value: Constants.API.key)
                )
            }

            return parameters
        }()

        guard let url = components.url else { throw APIError.badUrl }

        var urlRequest = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalCacheData
        )
        
        urlRequest.httpMethod = apiRouter.method

        let session = URLSession(configuration: .default)

        return try await withCheckedThrowingContinuation { continuation in
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    return continuation.resume(with: .failure(error))
                }

                guard let data = data else {
                    return continuation.resume(with: .failure(APIError.noData))
                }

                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        return continuation.resume(with: .success(responseObject))
                    }
                } catch {
                    return continuation.resume(with: .failure(error))
                }
            }
            dataTask.resume()
        }
    }
}
