//
//  ContentView.swift
//  Lesson-31-VisionOS
//
//  Created by Igor on 14.04.2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

/*
 
 
 DZ 31
 
 
 
 Описание/Пошаговая инструкция выполнения домашнего задания:
 Создать приложение для visionOS.
 1 Добавить два WindowGroup.
 2 Реализовать Drag and Drop с использованием .dropDestination.
 3 Добавить кнопку для добавления объектов usda/usdz.

 Критерии оценки:
 Каркас приложения 50 баллов
 Drag and Drop 25 баллов
 Добавление объекта 25 баллов

 
 */
