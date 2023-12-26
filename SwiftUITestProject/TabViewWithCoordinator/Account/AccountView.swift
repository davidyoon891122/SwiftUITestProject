//
//  AccountView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/21/23.
//

import SwiftUI

struct AccountView<Coordinator>: View where Coordinator: AccountCoordinatorProtocol {
    
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        NavigationView {
    
            VStack {
                NavigationLink(destination: AccountFirstView(coordinator: coordinator), isActive: $coordinator.isRootActive, label: {
                   Text("Go to the first Account View")
                       .frame(maxWidth: .infinity, minHeight: 50)
                       .foregroundColor(.black)
                       .background(Color.yellow)
                       .padding()
                       .cornerRadius(8.0)
               })
                
                NavigationLink(destination: AccountSecondView(coordinator: coordinator), isActive: $coordinator.isMoveSecondView, label: {
                    EmptyView()
                })
            }
            .navigationTitle("Account Main View")
            
        }.onAppear {
            print("onAppear AccountMainView")
            print(coordinator.isMoveSecondView)
        }
        .onDisappear {
            print("onDisappear AccountMainView")
        }
    }
}

struct AccountFirstView<Coordinator>: View where Coordinator: AccountCoordinatorProtocol {
    
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: AccountSecondView(coordinator: coordinator),
                label: {
                    Text("Go to the Second Account View")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundColor(.black)
                        .background(Color.yellow)
                        .padding()
                        .cornerRadius(8.0)
                })
        }
        .onAppear {
            print("onAppear AccountFirstView")
            print("isRootActive: \(coordinator.isRootActive)")
        }
        .onDisappear {
            print("onDisappear AccountFirstView")
        }
        .navigationTitle("Account First View")
    }
}

struct AccountSecondView<Coordinator>: View where Coordinator: AccountCoordinatorProtocol {
    
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            NavigationLink(destination: AccountThirdView(coordinator: coordinator), label: {
                Text("Go to the Third Account View")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .padding()
                    .cornerRadius(8.0)
            })
        }
        .onAppear {
            print("onAppear AccountSecondView")
            print("isRootActive: \(coordinator.isRootActive)")
        }
        .onDisappear {
            print("onDisappear AccountSecondView")
        }
        .navigationTitle("Account Second View")
    }
}

struct AccountThirdView<Coordinator>: View where Coordinator: AccountCoordinatorProtocol {
    
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Button(action: {
                coordinator.isRootActive = false
            }, label: {
                Text("Go to the Account Main View")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .padding()
                    .cornerRadius(8.0)
            })
            Spacer()
            Button(action: {
                coordinator.changeTab(tabType: .settings)
            }, label: {
                Text("Go to the Third Account View")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .padding()
                    .cornerRadius(8.0)
            })
        }
        .navigationTitle("Account Third View")
        .onAppear {
            print("onAppear AccountThirdView")
            print("isRootActive: \(coordinator.isRootActive)")
        }
        .onDisappear {
            print("onDisappear AccountThirdView")
        }
    }
}

#Preview {
    AccountView(coordinator: AccountCoordinator(coordinator: TabViewCoordinator()))
}
