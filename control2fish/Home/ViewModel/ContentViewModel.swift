//
//  ContentViewModel.swift
//  control2fish
//
//  Created by Taya on 07.09.2023.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    // static array
    @Published var allColors = ["peach1", "indigo8", "gray6", "red16", "green7", "blue2", "cyan5", "yellow20", "orange13", "purple15", "brown4", "pink14", "blueberry3", "mandarin10", "maroon11", "moss12", "salmon17", "silver18", "tin19", "white9"]
    
    // colors for contentView
    @Published var colors = ["peach1", "indigo8", "gray6", "red16", "green7", "blue2", "cyan5", "yellow20", "orange13", "purple15", "brown4", "pink14", "blueberry3", "mandarin10", "maroon11", "moss12", "salmon17", "silver18", "tin19", "white9"]
    
    @Published var fiveColors: [String] = []
    @Published var selectedColor = ""
    @Published var gearSelectedColor = ""
    static let shared = ContentViewModel()
    
    init() {
        fillFiveColors()
    }
    
    private func fillFiveColors() {
        for _ in 1...5 {
            fiveColors.append(generateUniqueColor())
        }
    }
    
    // MARK: выбирает цвет сам из 5, если не выбран пользователем
    func defaultRandomColor(){
        selectedColor = fiveColors.randomElement() ?? "pink14"
    }
    
    func addGearColor() {
        if fiveColors.count < 5 {
            fiveColors.append(gearSelectedColor)
            gearSelectedColor = ""
        }
    }
    
    func deleteCurrentColor() {
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
