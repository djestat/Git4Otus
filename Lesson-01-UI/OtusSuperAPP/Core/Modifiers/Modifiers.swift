//
//  Modifiers.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

import SwiftUI

struct ShapeIsRectModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content.contentShape(Rectangle())
    }
}
