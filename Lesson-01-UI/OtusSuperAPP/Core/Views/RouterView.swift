//
//  RouterView.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

import SwiftUI


final class ViewFactory {
    
    @ViewBuilder
    func view(for route: RouteScreen) -> some View {
        switch route {
        case .detail(let item): ItemDetailsScreen(item: item)
        }
    }
}

struct RouterView<Content: View>: View {
    
    @StateObject var router: Router = Router()
    private let viewFactory: ViewFactory = .init()
    private let content: Content
    
    //MARK: - Init
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: RouteScreen.self) { route in
                    viewFactory.view(for: route)
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    RouterView {
        VStack {
            Text("Screen")
        }
    }
}



