//
//  ContentView.swift
//  Lesson-24-WebSocket
//
//  Created by Igor on 14.04.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


/*
 
 Использование локальной(mesh) сети для создания приложений
 Цель:
 использовать Multipeer Connectivity в приложениях.

 Описание/Пошаговая инструкция выполнения домашнего задания:
 1. Использовать библиотеку от Apple – Multipeer Connectivity.
 2. Реализовать передачу текста между устройствами.
 3. Проверить работу на симуляторе, выступающем как одно из устройств.
 
 
 */
