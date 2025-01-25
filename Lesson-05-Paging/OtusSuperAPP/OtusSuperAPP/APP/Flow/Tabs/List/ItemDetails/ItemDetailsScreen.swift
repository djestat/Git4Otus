//
//  ItemDetailsScreen.swift
//  OtusSuperAPPL5
//
//  Created by Igor on 26.01.2025.
//

import SwiftUI

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

#Preview {
    //ItemDetailsScreen()
}
