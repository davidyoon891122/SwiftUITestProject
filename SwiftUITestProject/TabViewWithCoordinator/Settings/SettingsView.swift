//
//  SettingsView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/21/23.
//

import SwiftUI

struct SettingsView<Coordinator>: View where Coordinator: SettingsCoordinatorProtocol {
    
    @ObservedObject var coordinator: Coordinator
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SettingsFirstView(coordinator: coordinator), isActive: $coordinator.isRootActive, label: {
                    Text("Go to the FirstView")
                })
            }
            .navigationTitle("SettingsMainView")
        }
    }
}

struct SettingsFirstView<Coordinator>: View where Coordinator: SettingsCoordinatorProtocol {
    
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            NavigationLink(destination: SettingsSecondView(coordinator: coordinator), label: {
                Text("Go to the SecondView")
            })
        }
        .navigationTitle("SettingsFirstView")
    }
    
}

struct SettingsSecondView<Coordinator>: View where Coordinator: SettingsCoordinatorProtocol {
    
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            NavigationLink(destination: SettingsThirdView(coordinator: coordinator), label: {
                Text("Go to the ThirdView")
            })
        }
        .navigationTitle("SettingsSecondView")
    }
    
}

struct SettingsThirdView<Coordinator>: View where Coordinator: SettingsCoordinatorProtocol {
    
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Button(action: {
                coordinator.isRootActive.toggle()
            }, label: {
                Text("Go to the FirstView")
            })
        }
        .navigationTitle("SettingsThirdView")
    }
    
}



#Preview {
    SettingsView(coordinator: SettingsCoordinator(coordinator: TabViewCoordinator()))
}
