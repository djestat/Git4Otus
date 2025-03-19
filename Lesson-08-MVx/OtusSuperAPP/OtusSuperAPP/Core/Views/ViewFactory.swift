//
//  ViewFactory.swift
//  OtusSuperAPPL5
//
//  Created by Igor on 26.01.2025.
//

import SwiftUI

enum RouteScreen: Hashable {
    case detail(ItemModel)
    case imagePreview(URL?)
}

final class ViewFactory {
    
    //MARK: View
    @ViewBuilder
    func view(for route: RouteScreen) -> some View {
        switch route {
        case .detail(let item): ItemDetailsScreen(item: item)
        case .imagePreview(let url): ImagePreviewScreen(itemURL: url)
        }
    }
}
