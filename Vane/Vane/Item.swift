//
//  Item.swift
//  Vane
//
//  Created by Aleksei Kochetov on 05.07.2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
