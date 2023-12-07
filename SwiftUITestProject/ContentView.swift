//
//  ContentView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 2023/12/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Divider()
                .frame(height: 5)
//                .background(.blue)
                .overlay(.blue.opacity(0.5))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
