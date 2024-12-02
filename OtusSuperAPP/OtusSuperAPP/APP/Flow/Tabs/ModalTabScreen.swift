//
//  ModalTabScreen.swift
//  OtusSuperAPP
//
//  Created by Igor on 29.11.2024.
//

import SwiftUI
import WebKit

struct ModalTabScreen: View {
    
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 24) {

            WebSwiftUIView()
            
            Button {
                isSheetPresented.toggle()
            } label: {
                Label("Show Sheet", systemImage: "inset.filled.bottomhalf.rectangle")
            }
            .buttonStyle(.bordered)
            .padding(.bottom)
        }
        .navigationTitle("Modal Screen")
        .sheet(isPresented: $isSheetPresented) {
            SheetScreen()
        }
    }
}

struct SheetScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 24) {
            
            Text("Modal sheet view")
            
            Button {
                dismiss()
            } label: {
                Text("Hide Sheet with @Environment")
            }
            .buttonStyle(.bordered)
        }
        .padding(.top)
        .presentationDetents([.medium, .large])
    }
    
}

struct WebSwiftUIView: UIViewRepresentable {
    
    let url: URL = URL(string: "https://google.com")!
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: url))
    }
}

#Preview {
    ModalTabScreen()
}
