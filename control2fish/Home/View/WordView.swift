//
//  WordView.swift
//  control2fish
//
//  Created by Taya on 11.09.2023.
//

import SwiftUI

struct WordView: View {
    @StateObject private var viewModel = WordViewModel()
    
    var body: some View {
        ForEach(viewModel.randomWord, id: \.self) { word in
            Text(word)
        }
    }
}


#Preview {
    WordView()
}
