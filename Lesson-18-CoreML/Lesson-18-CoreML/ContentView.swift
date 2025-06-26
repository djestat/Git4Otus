//
//  ContentView.swift
//  Lesson-18-CoreML
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
 
 DZ 18
 
 Домашнее задание
 Обучение Классификатора или обжект идентификатора
 Цель:
 потренироваться в создании моделей для CoreML.

 Описание/Пошаговая инструкция выполнения домашнего задания:
 1. Выбрать датасет изображений.
 2. Обучить классификатор или детектор с помощью CreateML.
 3. Встроить функционал распознавания в приложение: использовать камеру или загрузку изображений.
 *4. Реализовать распознавание в ARViewContainer.
 
 */

//https://www.kodeco.com/7960296-core-ml-and-vision-tutorial-on-device-training-on-ios
