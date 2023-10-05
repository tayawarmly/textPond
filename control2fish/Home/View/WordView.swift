//
//  WordView.swift
//  control2fish
//
//  Created by Taya on 11.09.2023.
//

import SwiftUI

struct WordView: View {
    @StateObject private var viewModel = WordViewModel()
    @State var selectedColor: String
    var body: some View {
        VStack {
            Text(viewModel.generatedText)
                .padding(.horizontal, 15)
                .padding(.top, 30)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(selectedColor))
    }
}

#Preview {
    WordView(selectedColor: "pink14")
}
