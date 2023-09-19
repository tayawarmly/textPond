//
//  WordsModel.swift
//  control2fish
//
//  Created by Taya on 19.09.2023.
//

import Foundation

class WordsModel: ObservableObject {
    private var words = ["Автограф", "Грабли", "Изощренный", "Органопластика", "Перессорить", "Прикрепиться", "Продернуть", "Продырявиться", "Разноситься", "Сортировщик"]
    @Published var randomWord: [String] = []
    init() {randomWords()}
    
    private func randomWords () -> String  {
        let randomWord = words.randomElement()
//        print (randomWord)
        return randomWords()
             
    }
}
