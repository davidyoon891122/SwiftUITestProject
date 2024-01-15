//
//  EquatableTestView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 1/2/24.
//

import SwiftUI

struct EquatableTestView: View {
    
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("Count: \(count)")
            
            Button("Random") {
                count = Int.random(in: 0...10000)
            }
            
            OddAndEvenView(number: count)
            
        }
    }
    
}

struct OddAndEvenView: Equatable, View {
    
    let number: Int
    @State private var flag: Bool = false
    
    var body: some View {
        let animation = Animation.linear(duration: 3.0).repeatForever(autoreverses: false)
        print("init")
        return VStack {
            Text(number.isMultiple(of: 2) ? "Even" : "Odd")
        }
        .foregroundStyle(.white)
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10).fill(number.isMultiple(of: 2) ? .red : .blue))
        .rotationEffect(.degrees(self.flag ? 0 : 360))
        .onAppear {
            withAnimation(animation) {
                self.flag.toggle()
            }
        }
        
    }
    
    static func == (lhs: OddAndEvenView, rhs: OddAndEvenView) -> Bool {
        lhs.number.isMultiple(of: 2) == rhs.number.isMultiple(of: 2)
    }
    
}

#Preview {
    EquatableTestView()
}
