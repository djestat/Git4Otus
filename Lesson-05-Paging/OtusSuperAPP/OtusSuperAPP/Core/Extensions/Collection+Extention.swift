//
//  Collection+Extention.swift
//  OtusSuperAPP
//
//  Created by Igor on 21.12.2024.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    
    func isPrefethingElement<Item: Identifiable>(_ item: Item) -> Bool {
        guard isEmpty == false else { return false }
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else { return false}
        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance <= 5
    }
    
}
