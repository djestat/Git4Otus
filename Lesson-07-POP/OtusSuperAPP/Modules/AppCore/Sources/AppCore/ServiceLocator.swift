//
//  ServiceLocator.swift
//  
//
//  Created by Igor on 09.02.2025.
//

import Foundation

public class ServiceLocator {
    
    public static let shared: ServiceLocator = ServiceLocator()
    
    private lazy var services: [String: AnyObject] = [:]
    
    public func addService<T: AnyObject>(_ service: T) {
        let key = keyForService(T.self)
        if services[key] == nil {
            services[key] = service
        }
    }
    
    public func getService<T: AnyObject>(_ type: T.Type) -> T? {
        services[keyForService(type)] as? T
    }
    
    private func keyForService<T: AnyObject>(_ type: T.Type) -> String {
        String(describing: type)
    }
}
