//
//  RequestTypeView.swift
//  DesignKit
//
//  Created by Igor on 18.02.2025.
//

import SwiftUI

public struct RequestTypeView: View {
    
    private let title: String
    private let isSelected: Bool
    
    //MARK: - Init
    public init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }
    
    public var body: some View {
        Text(title)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .background {
                RoundedRectangle(cornerRadius: 6)
                    .foregroundStyle(isSelected ? Color.teal.opacity(0.2) : Color.gray.opacity(0.1))
            }
            .tapableAllZone()
    }
}

#Preview {
    VStack {
        ScrollView(.horizontal) {
            HStack {
                RequestTypeView(title: "title", isSelected: Bool.random())
                RequestTypeView(title: "title", isSelected: Bool.random())
                RequestTypeView(title: "title", isSelected: Bool.random())
            }
        }        
    }
}
