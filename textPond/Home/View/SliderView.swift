//
//  SliderView.swift
//  control2fish
//
//  Created by Taya on 17.10.2023.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var offset : Int
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 30)
            
            Capsule()
                .fill(Color("setYellow").opacity(0.75))
                .frame(width: CGFloat(offset) + 20, height: 30)
            
            Circle()
                .fill(Color("setOrange"))
                .frame(width: 35, height: 35)
                .background(Circle().stroke(Color.white, lineWidth: 5))
                .offset(x: CGFloat(offset))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50 {
                                offset = Int(value.location.x - 20)
                            }
                        }
                )
        }
        .padding()
//        .background(Color.blue.opacity(0.1))
    }
    
}

#Preview {
    SliderView(offset: .constant(40))
}
