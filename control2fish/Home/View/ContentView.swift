//
//  ContentView.swift
//  control2fish
//
//  Created by Taya on 05.09.2023.
//

import SwiftUI

struct ContentView: View {
   
    @StateObject var viewModel: ContentViewModel
    @State private var gearWindow = false
    @State private var randomWord = false
    @State var selectedColor = ""
    @State var gearSelectedColor = ""
    
    init() {
        self._viewModel = StateObject(wrappedValue: ContentViewModel.shared)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                
                // сетка цветов
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15, content: {
                    ForEach(viewModel.fiveColors, id: \.self) { color in
                        
                        Button {
                            selectedColor = color
                        } label: {
                            Rectangle()
                                .frame(width: 75, height: 75)
                              
                                .cornerRadius(15)
                                .foregroundStyle(Color(color))
                                .shadow(radius: 1.2)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .tint(.clear)
                                        .border(selectedColor == color ? Color.blue : Color.clear, width: 5)
                                    }
                        }
                    }
                })
                
                Spacer()
                
                // кнопка сгенерировать
                Button {
                    // выбирает слово из массива
                    randomWord.toggle()
                    viewModel.deleteCurrentColor(selectedColor: selectedColor)
                } label: {
                    Text("Сгенировать")
                        .bold()
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .frame(width: 150, height: 50)
                        .background(.blue.opacity(0.9), in: Capsule())
                }
                .sheet(isPresented: $randomWord) {
                    WordView(selectedColor: selectedColor)
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
                        GearWindowView(gearSelectedColor: gearSelectedColor)
                        .presentationDragIndicator(.hidden)}
                }
            }
        }
    }
}
// TODO: функцию доб цвета на 1 экран
#Preview {
        ContentView()
}
