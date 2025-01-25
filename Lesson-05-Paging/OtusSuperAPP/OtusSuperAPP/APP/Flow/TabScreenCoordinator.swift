//
//  TabScreenCoordinator.swift
//  OtusSuperAPPL5
//
//  Created by Igor on 26.01.2025.
//

import Foundation

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
    
    let listCoordinator: ListScreenCoordinator = .init()
    
    //MARK: Inputs
    func toList() {
        selectedTab = .list
        listCoordinator.needShowRandomItem = true
    }
    
}
