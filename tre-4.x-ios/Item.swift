//
//  Item.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-24.
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
