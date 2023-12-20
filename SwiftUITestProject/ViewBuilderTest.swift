//
//  ViewBuilderTest.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/20/23.
//

import SwiftUI

struct ViewBuilderTest: View {
    var body: some View {
        CustomView {
            Text("Hello, World!")
        }
    }
}

struct CustomView<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack {
            Text("Header")
                .font(.largeTitle)
                .foregroundColor(.blue)
            content()
        }
    }
}

#Preview {
    ViewBuilderTest()
}
