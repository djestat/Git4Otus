//
//  Item.swift
//  Lesson-26-AppSecurity
//
//  Created by Igor on 14.04.2025.
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
