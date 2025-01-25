//
//  TabScreen.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

import SwiftUI

struct TabScreen: View {
    
    @StateObject private var coordinator: TabScreenCoordinator = .init()
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            MainTabScreen()
                .tag(TabSelection.main)
                .tabItem { tabItemFor(.main) }
            
            RouterView {
                ListTabScreen()
            }
            .tag(TabSelection.list)
            .tabItem { tabItemFor(.list)  }

            ModalTabScreen()
                .tag(TabSelection.modal)
                .tabItem { tabItemFor(.modal) }
        }
        .tint(.red)
        .environmentObject(coordinator)
    }
    
    @ViewBuilder
    private func tabItemFor(_ tag: TabSelection) -> some View {
        let isSelected = coordinator.selectedTab == tag
        switch tag {
        case .main: Label("Main", systemImage: tag.icon(isSelected))
        case .list: Label("List", systemImage: tag.icon(isSelected))
        case .modal: Label("Modal", systemImage: tag.icon(isSelected))
        }
    }
}

#Preview {
    TabScreen()
}
