//
//  Storage.swift
//  DataStorage
//
//  Created by Igor on 10.02.2025.
//

import Foundation

public class Storage {

    func save<T: Codable>(_ value: T, to key: String) {
        UserDefaults.standard.set(try? JSONEncoder().encode(value), forKey: key)
    }

    func read<T: Codable>(_ type: T.Type, from key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    func delete(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
}
