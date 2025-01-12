//
//  TabScreen.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

import SwiftUI

enum TabSelection: Hashable {
    case main, list, modal
    
    func icon(_ isSelected: Bool) -> String {
        switch self {
        case .main: isSelected ? "tray.full.fill" : "tray.fill"
        case .list: isSelected ? "list.bullet.rectangle" : "list.dash.header.rectangle"
        case .modal: isSelected ? "inset.filled.bottomhalf.rectangle" : "dock.rectangle"
        }
    }

}

final class TabScreenCoordinator: ObservableObject {
    
    @Published var selectedTab: TabSelection = .main
    
    let listViewModel: ListViewModel = .init()
    
    //MARK: Inputs
    func toRandomItemInList() {
        selectedTab = .list
        listViewModel.needShowRandomItem = true
    }
    
}

struct TabScreen: View {
    
    @StateObject private var coordinator: TabScreenCoordinator = .init()
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            
            MainTabScreen()
                .tag(TabSelection.main)
                .tabItem { tabItemFor(.main) }
            
            RouterView {
                ListTabScreen(viewModel: coordinator.listViewModel)
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
