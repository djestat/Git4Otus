//
//  ListTabScreen.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

import SwiftUI

struct ItemModel: Identifiable, Hashable {
    let id: Int = UUID().hashValue
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
}

final class ListViewModel: ObservableObject {
        
    @Published var items: [ItemModel] = [ItemModel("🎥"), ItemModel("🎬"), ItemModel("🎮"),
                                         ItemModel("📱"), ItemModel("📺"), ItemModel("💡"),
                                         ItemModel("🎶"), ItemModel("🎨"), ItemModel("👟"),
                                         ItemModel("👠"), ItemModel(" 👡"), ItemModel("👞")]
    
    @Published var needShowRandomItem: Bool = false
    
}

struct ListTabScreen: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        List {
            ForEach(viewModel.items) { item in
                itemCardView(item)
            }
        }
        .navigationTitle("List")
        .onAppear {
            if viewModel.needShowRandomItem {
                if let item = viewModel.items.randomElement() {
                    router.navigateTo(.detail(item))
                }
                viewModel.needShowRandomItem = false
            }
        }
    }
    
    @ViewBuilder
    private func itemCardView(_ item: ItemModel) -> some View {
        Button {
            router.navigateTo(.detail(item))
        } label: {
            Text(item.name)
                .font(.headline)
        }
    }
}

struct ItemDetailsScreen: View {
    
    var item: ItemModel
    
    var body: some View {
        VStack {
            Text(item.name)
                .font(.headline)
            
            Text(item.name)
                .font(.title)
            
            Text(item.name)
                .font(.largeTitle)
            
            Text(item.name)
                .font(.headline)
        }
        .navigationTitle("Details")
    }
    
}

#Preview {
    ListTabScreen(viewModel: ListViewModel())
}
