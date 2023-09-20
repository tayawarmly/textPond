//
//  ContentView.swift
//  control2fish
//
//  Created by Taya on 05.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gearWindow = false
    @State private var randomWord = false
    
    
    //    private var randomeWord: String = []
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        VStack(spacing: 50) {
            
            // сетка цветов
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
            
            Spacer()
            
            // кнопка сгенерировать
            Button {
                // выбирает слово из массива
                randomWord.toggle()
            } label: {
                Text("Сгенировать")
                    .bold()
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .frame(width: 150, height: 50)
                    .background(.blue.opacity(0.9), in: Capsule())
            }
            .sheet(isPresented: $randomWord) {
                WordView()
                .presentationDragIndicator(.hidden)}
        }
        .padding(.vertical, 25)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                
                // кнопка шестеренка с всплывающим экраном
                Button {
                    gearWindow.toggle()
                } label: {
                    Image(systemName: "gearshape.fill")
                        .font(.title)
                        .foregroundStyle(.black.opacity(0.4))
                }
                .sheet(isPresented: $gearWindow) {
                    GearWindowView()
                    .presentationDragIndicator(.hidden)}
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
