//
//  ContentView.swift
//  control2fish
//
//  Created by Taya on 05.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gearWindow = false
    
    private var words = ["Автограф", "Грабли", "Изощренный", "Органопластика", "Перессорить", "Прикрепиться", "Продернуть", "Продырявиться", "Разноситься", "Сортировщик"]
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        // кнопка шестеренка с всплывающим экраном
        
        HStack (spacing: 30) {
            Spacer()
            
            Button {
                gearWindow.toggle()
            } label: {
                Image(systemName: "gearshape.fill")
                    .foregroundStyle(.black.opacity(0.4))
            }
            .sheet(isPresented: $gearWindow) {
                GearWindowView()}
        }
        
        // сетка цветов
        
        VStack(spacing: 50) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 25, content: {
                ForEach(viewModel.fiveColors, id: \.self) { color in
                    
                    Button {
                        
                    } label: {
                        Rectangle()
                            .frame(width: 75, height: 75)
                            .cornerRadius(15)
                            .foregroundStyle(Color(color))
                    }
                }
            })
            
        
            // кнопка сгенерировать
            
            Button(action: {

                // выбирает слово из массива и вывод на экран?
                func randomWord () -> String {
                    let randomWord = words.randomElement() ?? "закончились слова"
                    return (randomWord)
                }
            },
                   label: {
                Text("Сгенировать")
                    .bold()
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .frame(width: 150, height: 50)
                    .background(.blue.opacity(0.9), in: Capsule())
            })
        }
    }
}

#Preview {
    ContentView()
}
