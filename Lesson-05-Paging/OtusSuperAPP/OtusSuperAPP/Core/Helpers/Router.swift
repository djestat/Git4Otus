//
//  Router.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

import SwiftUI

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
    
}
