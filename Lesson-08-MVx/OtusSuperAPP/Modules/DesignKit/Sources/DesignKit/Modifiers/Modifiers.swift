//
//  Modifiers.swift
//  DesignKit
//
//  Created by Igor on 18.02.2025.
//

import SwiftUI

struct ShapeIsRectModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content.contentShape(Rectangle())
    }
    
}
