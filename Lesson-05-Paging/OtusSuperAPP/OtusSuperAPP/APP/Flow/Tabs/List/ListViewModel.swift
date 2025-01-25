//
//  ListViewModel.swift
//  OtusSuperAPPL5
//
//  Created by Igor on 26.01.2025.
//

import Foundation
import SwiftUI
import Networking

struct ItemModel: Identifiable, Hashable {
    let id: Int = UUID().hashValue
    let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
}

enum QueryType: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    
    case iphone, android, games, series, apple, cats
}

final class ListViewModel: ObservableObject {
        
    @Published var items: [ItemModel] = []
        
    @Published private(set) var queryType: QueryType = .iphone
    
    private var from: String { "2025-01-24" }
    private var sortBy: String { "publishedAt" }
    private var language: String { "en" }
    private var apiKey: String { "3360a255ef2440e7934aaa1903e1e5af" }

    private var page: Int = 1
    @Published var canLoad = true
    @Published var finished = false

    func fetchItems() {
        guard canLoad, !finished else { return }
        canLoad = false
        
        Task { @MainActor in
            ArticlesAPI
                .everythingGet(q: queryType.rawValue,
                               from: from,
                               sortBy: sortBy,
                               language: language,
                               apiKey: apiKey,
                               page: page) { data, error in
                    if let data {
                        if let articles = data.articles, !articles.isEmpty {
                            let newItems = articles.map({ ItemModel($0) })
                            self.items.append(contentsOf: newItems)
                            self.page += 1
                        } else {
                            self.finished = true
                        }
                    } else {
                        print("Error: \(error?.localizedDescription ?? "")")
                        self.items = []
                        self.finished = true
                    }
                    self.canLoad = true
                }
        }
    }
    
    func newQuery(_ query: QueryType) {
        guard queryType != query else { return }
        items.removeAll()
        page = 1
        finished = false
        queryType = query
        fetchItems()
    }
    
    var needLoader: Bool { !canLoad && !finished }

    func needLoaderFor(_ item: ItemModel) -> Bool {
        !canLoad && !finished && items.last == item
    }
}
