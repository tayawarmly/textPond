//
//  ContentView.swift
//  control2fish
//
//  Created by Taya on 05.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @State private var infoWindow = false
    @State private var gearWindow = false
    @State private var randomWord = false
    @State private var gearWindowOpen = true
    @State private var wordsQuantity = 10
    
//    init() {
//        self._viewModel = StateObject(wrappedValue: ContentViewModel.shared)
//    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                
                // сетка цветов
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15, content: {
                    ForEach(viewModel.fiveColors, id: \.self) { color in
                        
                        Button {
                            withAnimation(.spring) {
                                viewModel.selectedColor = color
                            }
                        } label: {
                            Rectangle()
                                .frame(width: 75, height: 75)
                                .cornerRadius(15)
                                .foregroundStyle(Color(color))
                                .shadow(radius: 1.2)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .tint(.clear)
                                        .border(viewModel.selectedColor == color ? Color.green : Color.clear, width: 5)
                                }
                        }
                    }
                })
                
                Spacer()
                
                // слайдер + окно с цифрами
                //
                Capsule()
                    .fill(Color.white)
                    .frame(width: 100, height: 40)
                    .overlay {
                        Capsule().stroke(Color.orange, lineWidth: 3)
                    }
                    .overlay {
                        Text(wordsQuantity.description)
                            .font(.title2)
                            .bold()
                    }
                
                SliderView(offset: $wordsQuantity)
                
                Spacer()
                
                // кнопка сгенерировать
                Button {
                    if viewModel.selectedColor.isEmpty {
                        viewModel.defaultRandomColor()
                    }
                    // выбирает слово из массива
                    randomWord.toggle()
                    viewModel.deleteCurrentColor()
                } label: {
                    Text("Сгенерировать")
                        .bold()
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                        .frame(width: 170, height: 50)
                        .background(.blue.opacity(0.9), in: Capsule())
                }
                .sheet(isPresented: $randomWord) {
                    WordView(selectedColor: viewModel.selectedColor)
                    .presentationDragIndicator(.hidden)}
                .onChange(of: randomWord) { newValue in
                    if !newValue { viewModel.selectedColor = "" }
                }
            }
            .padding(20)
            .background(.white.opacity(0.3))
            .cornerRadius(25)
            .padding(5)
//            .background(Image("bgImage"))
            .background(Color.black.opacity(0.2))
            .padding(.vertical, 25)
            .toolbar {
                // кнопка с информацией
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        infoWindow.toggle()
                    } label: {
                        Image(systemName: "exclamationmark.circle.fill")
                            .font(.title)
                            .foregroundStyle(.black.opacity(0.4))
                    }
                    .sheet(isPresented: $infoWindow) {
                        InfoView()
                        .presentationDragIndicator(.hidden)}
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    // кнопка шестеренка с всплывающим экраном
                    Button {
                        gearWindow.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(.title)
                            .foregroundStyle(.black.opacity(0.4))
                    }
                    .sheet(isPresented: $gearWindow, onDismiss: {
                        gearWindowOpen = true
                        //                        viewModel.gearSelectedColor = "pink14"
                    }, content: {
                        GearWindowView(gearWindowOpen: gearWindowOpen)
                            .presentationDragIndicator(.hidden)
                    })
                    .onChange(of: randomWord) { newValue in
                        if !newValue { viewModel.selectedColor = "" }
                    }
                }
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
