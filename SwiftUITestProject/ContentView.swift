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
            TabViewWithCoordinator(coordinator: TabViewCoordinator())
        }
    }
}

#Preview {
    ContentView()
}
