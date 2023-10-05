//
//  GearWindowView.swift
//  control2fish
//
//  Created by Taya on 11.09.2023.
//

import SwiftUI

struct GearWindowView: View {
    
    @StateObject var viewModel: ContentViewModel
    @State var gearSelectedColor: String
    
    init(gearSelectedColor: String) {
        self._viewModel = StateObject(wrappedValue: ContentViewModel.shared)
        self.gearSelectedColor = gearSelectedColor
    }
    
    var body: some View {
        VStack(spacing: 25) {
            
            // сетка цветов
            Text("Все цвета")
                .font(.title2.bold())
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 15, content: {
                ForEach(viewModel.allColors, id: \.self) { color in
                    
                    Button {
                        gearSelectedColor = color
                    } label: {
                        Rectangle()
                            .frame(width: 75, height: 75)
                            .cornerRadius(15)
                            .foregroundStyle(Color(color))
                            .shadow(radius: 1.2)
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .tint(.clear)
                                    .border(gearSelectedColor == color ? Color.blue : Color.clear, width: 5)
                                }

                    }
                }
            })
        }
    }
}
#Preview {
    GearWindowView(gearSelectedColor: "pink14")
}

