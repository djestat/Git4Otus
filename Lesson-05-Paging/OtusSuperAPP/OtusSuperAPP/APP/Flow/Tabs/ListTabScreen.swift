//
//  ListTabScreen.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

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
    
    case iphone, android, games, serials
}

final class ListViewModel: ObservableObject {
        
    @Published var items: [ItemModel] = []
        
    @Published private(set) var queryType: QueryType = .iphone
    
    private var from: String { "2024-12-20" }
    private var sortBy: String { "popularity" }
    private var language: String { "en" }
    private var apiKey: String { "e17c61e2c28e4ec8be933073cf5d1d02" }

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
}

struct ListTabScreen: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(QueryType.allCases) { type in
                        Text("\(type)")
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .background {
                                let selected = viewModel.queryType == type
                                RoundedRectangle(cornerRadius: 6)
                                    .foregroundStyle(selected ? Color.gray.opacity(0.3) : Color.clear)
                            }
                            .onTapGesture {
                                viewModel.newQuery(type)
                            }
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 32)
            
            if viewModel.items.isEmpty {
                Spacer()
                Text("No search results")
                Spacer()
            } else {
                List {
                    ForEach(viewModel.items) { item in
                        let needLoader = !viewModel.canLoad && !viewModel.finished && viewModel.items.last == item
                        itemCardView(item)
                            .onAppear {
                                if viewModel.items.isPrefethingElement(item) {
                                    viewModel.fetchItems()
                                }
                            }
                        if needLoader {
                            VStack {
                                ProgressView()
                                    .padding(.vertical, 24)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("List")
        .onAppear {
            viewModel.fetchItems()
        }
    }
    
    @ViewBuilder
    private func itemCardView(_ item: ItemModel) -> some View {
        Button {
            router.navigateTo(.detail(item))
        } label: {
            Text(item.article.title ?? "no title")
                .font(.headline)
        }
    }
}

struct ItemDetailsScreen: View {
    
    @EnvironmentObject var router: Router
    
    var item: ItemModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(item.article.title ?? "no title")
            
            Text(item.article.url)
            
            Text(item.article.author ?? "no author")
            
            if let imageURL = item.article.urlToImage,
               let url = URL(string: imageURL) {
                Button("Show Preview") {
                    router.navigateTo(.imagePreview(url))
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("Details")
    }
    
}

struct ImagePreviewScreen: View {
    
    var itemURL: URL?
    
    var body: some View {
        VStack {
            AsyncImage(url: itemURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            } placeholder: {
                ProgressView()
            }

        }
        .navigationTitle("Image Preview")
    }
    
}

#Preview {
    ListTabScreen(viewModel: ListViewModel())
}
