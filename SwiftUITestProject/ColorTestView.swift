//
//  ColorTestView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 1/24/24.
//

import SwiftUI

struct ColorTestView: View {
    
    let color1 = Color(hex: "#2E3192", alpha: 1.0)
    let color2 = Color(hex: "#1BFFFF", alpha: 0.8)
    
    var body: some View {
        VStack {
            Text("First Color")
                .foregroundStyle(color1)
            Text("Second Color")
                .foregroundStyle(color2)
        }
    }
    
}

#Preview {
    ColorTestView()
}
