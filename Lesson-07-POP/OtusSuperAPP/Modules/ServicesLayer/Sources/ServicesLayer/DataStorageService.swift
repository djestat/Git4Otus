//
//  DataStorageService.swift
//  ServicesLayer
//
//  Created by Igor on 10.02.2025.
//

import Foundation
import Networking
import DataStorage

public class DataStorageService {
    
    public init() { }
    
    public func saveArticles(_ data: ArticleList) {
        let count = data.articles?.count ?? 0
        print("Saved \(count) articles")
    }
    
    public func getSavedArticles() -> [Article] {
        let count = Int.random(in: 1...10)
        print("Readed \(count) articles")
        return []
    }
    
}
