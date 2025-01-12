//
//  Router.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

import SwiftUI

enum RouteScreen: Hashable {
    case detail(ItemModel)
    case imagePreview(URL?)
}

class Router: ObservableObject {
    
    @Published var path: NavigationPath = NavigationPath()
    
    //MARK: - Inputs
    func navigateTo(_ appRoute: RouteScreen) {
        path.append(appRoute)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    //MARK: View
    @ViewBuilder
    func view(for route: RouteScreen) -> some View {
        switch route {
        case .detail(let item): ItemDetailsScreen(item: item)
        case .imagePreview(let url): ImagePreviewScreen(itemURL: url)
        }
    }
    
}
