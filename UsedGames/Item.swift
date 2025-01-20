//
//  Item.swift
//  UsedGames
//
//  Created by Buket Bayhan on 20.01.2025.
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
