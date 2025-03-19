//
//  InjectedWrapper.swift
//  AppCore
//
//  Created by Igor on 09.02.2025.
//

import Foundation
import SwiftUI

@propertyWrapper
public struct Injected<T: AnyObject> {
    
    private var service: T?
    
    private weak var serviceManager = ServiceLocator.shared
    
    public var wrappedValue: T? {
        mutating get {
            if service == nil {
                service = serviceManager?.getService(T.self)
            }
            return service
        }
        mutating set { service = newValue }
    }
    
    public var projectedValue: Injected<T> {
        get { self }
        mutating set { self = newValue }
    }
    
    public init() {}

}
