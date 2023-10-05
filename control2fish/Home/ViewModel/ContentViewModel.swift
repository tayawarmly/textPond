//
//  ContentViewModel.swift
//  control2fish
//
//  Created by Taya on 07.09.2023.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    // static array
    @Published var allColors = ["black1", "indigo8", "gray6", "red16", "green7", "blue2", "cyan5", "yellow20", "orange13", "purple15", "brown4", "pink14", "blueberry3", "mandarin10", "maroon11", "moss12", "salmon17", "silver18", "tin19", "white9"]
    
    // colors for contentView
    @Published var colors = ["black1", "indigo8", "gray6", "red16", "green7", "blue2", "cyan5", "yellow20", "orange13", "purple15", "brown4", "pink14", "blueberry3", "mandarin10", "maroon11", "moss12", "salmon17", "silver18", "tin19", "white9"]
    
    @Published var fiveColors: [String] = []
    
    static let shared = ContentViewModel()
    
    init() {
        fillFiveColors()
    }
    
    private func fillFiveColors() {
        for _ in 1...5 {
            fiveColors.append(generateUniqueColor())
        }
    }
    
    func deleteCurrentColor(selectedColor: String) {
        fiveColors.removeAll(where: { $0 == selectedColor})
        if fiveColors.count < 4 {
            fiveColors.append(generateUniqueColor())
            fiveColors.append(generateUniqueColor())
        }
    }
    
    private func generateUniqueColor() -> String {
        if colors.isEmpty { colors = allColors }
        let generatedColor = colors.randomElement()
        colors.removeAll(where: { $0 == generatedColor })
        return generatedColor ?? "orange"
    }
}
