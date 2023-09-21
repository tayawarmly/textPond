//
//  WordViewModel.swift
//  control2fish
//
//  Created by Taya on 19.09.2023.
//

import Foundation

class WordViewModel: ObservableObject {
    private var words = ["Автограф", "Грабли", "Изощренный", "Органопластика", "Перессорить", "Прикрепиться", "Продернуть", "Продырявиться", "Разноситься", "Сортировщик"]
    
    @Published var randomWords: [String?] = []
    init() {getRandomWords()}
    
    private func getRandomWords () {
        var randomWord = words.randomElement()
        randomWords.append(randomWord)
    }
}
