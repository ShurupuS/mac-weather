//
//  VaneApp.swift
//  Vane
//
//  Created by Aleksei Kochetov on 05.07.2023.
//

import SwiftUI
import SwiftData

@main
struct VaneApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
