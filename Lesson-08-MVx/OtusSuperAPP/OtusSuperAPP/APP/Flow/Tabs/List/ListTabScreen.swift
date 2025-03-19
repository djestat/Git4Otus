//
//  ListTabScreen.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

import SwiftUI
import DesignKit

struct ListTabScreen: View {
    
    @EnvironmentObject var coordinator: ListScreenCoordinator
    @EnvironmentObject var router: Router
    @StateObject var viewModel: ListViewModel = .init()

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(QueryType.allCases) { type in
                        requestTypeView(type)
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.never)
            .frame(height: 32)
            
            if viewModel.items.isEmpty {
                Spacer()
                Text("No search results")
                Spacer()
            } else {
                List {
                    ForEach(viewModel.items) { item in
                        itemCardView(item)
                            .onAppear {
                                if viewModel.items.isPrefethingElement(item) {
                                    viewModel.fetchItems()
                                }
                            }
                        if viewModel.needLoaderFor(item) {
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
    private func requestTypeView(_ type: QueryType) -> some View {
        let isSelected = viewModel.queryType == type
        RequestTypeView(title: type.rawValue, isSelected: isSelected)
            .onTapGesture {
                viewModel.newQuery(type)
            }
    }
    
    @ViewBuilder
    private func itemCardView(_ item: ItemModel) -> some View {
        Button {
            router.navigateTo(.detail(item))
        } label: {
            ItemCardView(title: item.article.title ?? "no title")
        }
    }
}

#Preview {
    ListTabScreen(viewModel: ListViewModel())
}
