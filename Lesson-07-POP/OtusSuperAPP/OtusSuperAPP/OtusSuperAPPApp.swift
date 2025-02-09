//
//  OtusSuperAPPApp.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

import SwiftUI
import ServicesLayer

@main
struct OtusSuperAPPApp: App {
    var body: some Scene {
        WindowGroup {
            TabScreen()
                .onAppear {
                    ServicesConfigurator.shared.register()
                }
        }
    }
}
