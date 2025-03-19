//
//  ImagePreviewScreen.swift
//  OtusSuperAPPL5
//
//  Created by Igor on 26.01.2025.
//

import SwiftUI

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
    //ImagePreviewScreen()
}
