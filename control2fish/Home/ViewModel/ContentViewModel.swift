//
//  ContentViewModel.swift
//  control2fish
//
//  Created by Taya on 07.09.2023.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
private var colorsForCards: [Color] = [.black, .indigo, .gray, .red, .green, .blue, .cyan, .yellow, .orange, .purple, .brown, .pink]
    @Published var fiveColors: [Color] = []
    
    init() {
        fillFiveColors()
    }
    
    private func fillFiveColors() {
        for _ in 1...5 {
            fiveColors.append(generateUniqueColor())
        }
    }
    func deleteCurrentColor(id: Color) {
        fiveColors.removeAll(where:  { $0 == id })
    }
    
    private func generateUniqueColor() -> Color {
        let generatedColor = colorsForCards.randomElement()
        colorsForCards.removeAll(where: { $0 == generatedColor })
        return generatedColor ?? .white
    }
}
