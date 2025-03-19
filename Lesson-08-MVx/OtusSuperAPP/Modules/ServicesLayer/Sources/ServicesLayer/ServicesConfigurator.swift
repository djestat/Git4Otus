//
//  ServicesConfigurator.swift
//  ServicesLayer
//
//  Created by Igor on 10.02.2025.
//

import Foundation
import AppCore

public class ServicesConfigurator {
    
    public static let shared = ServicesConfigurator()
    
    public func register() {
        ServiceLocator.shared.addService(NetworkingService())
        ServiceLocator.shared.addService(DataStorageService())
    }
    
}

