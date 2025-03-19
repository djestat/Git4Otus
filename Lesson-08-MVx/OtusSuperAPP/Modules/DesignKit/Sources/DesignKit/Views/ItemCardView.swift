//
//  SwiftUIView.swift
//  DesignKit
//
//  Created by Igor on 18.02.2025.
//

import SwiftUI

public struct ItemCardView: View {
    
    private let title: String
    
    //MARK: - Init
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(title)
            .font(.headline)
    }
}


#Preview {
    ScrollView(.horizontal) {
        VStack {
            ItemCardView(title: "title")
            ItemCardView(title: "title")
            ItemCardView(title: "title")
            ItemCardView(title: "title")
            ItemCardView(title: "title")
            ItemCardView(title: "title")
            ItemCardView(title: "title")
        }
    }
}
