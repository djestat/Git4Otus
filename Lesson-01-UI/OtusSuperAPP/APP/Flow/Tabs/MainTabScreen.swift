//
//  MainTabScreen.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

import SwiftUI

struct MainTabScreen: View {
    
    @EnvironmentObject var coordinator: TabScreenCoordinator
    
    var body: some View {
        VStack {
            Button {
                coordinator.toListWithRandomItemIn()
            } label: {
                Text("Show random item on the list")
            }
            .font(.headline)
        }
        .navigationTitle("Main")
    }
}

#Preview {
    MainTabScreen()
}
