//
//  ContentViewModel.swift
//  control2fish
//
//  Created by Taya on 07.09.2023.
//

import Foundation

class ContentViewModel: ObservableObject {
private var colorsForCards = ["black", "indigo", "gray", "red", "green", "blue", "cyan", "yellow", "orange", "purple", "brown", "pink"]
    @Published var fiveColors: [String] = []
    
    init() {
        fillFiveColors()
    }
    
    private func fillFiveColors() {
        for _ in 1...5 {
            fiveColors.append(generateUniqueColor())
        }
    }
    
    func deleteCurrentColor(id: String) {
//        fiveColors.removeAll(where:  { $0 as! String == id })
    }
    
    private func generateUniqueColor() -> String {
        let generatedColor = colorsForCards.randomElement()
        colorsForCards.removeAll(where: { $0 == generatedColor })
        return generatedColor ?? "orange"
    }
}
