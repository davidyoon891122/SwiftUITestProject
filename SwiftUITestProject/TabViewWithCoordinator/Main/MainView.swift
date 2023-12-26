//
//  MainView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/21/23.
//

import SwiftUI

struct MainView<Coordinator>: View where Coordinator: MainCoordinatorProtocol {
    
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: MainFirstView(coordinator: coordinator),
                    label: {
                        Text("Go To the MainFirstView")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .foregroundColor(.black)
                            .background(Color.yellow)
                            .cornerRadius(8.0)
                            .padding()
                    })
            }
            .navigationTitle("Main View")
        }
        .onAppear {
            print("onAppear MainView")
        }
        .onDisappear {
            print("onDisappear MainView")
        }
    }
}

struct MainFirstView<Coordinator>: View where Coordinator: MainCoordinatorProtocol{
    
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            VStack {
                NavigationLink(destination: MainSecondView(coordinator: coordinator), label: {
                    Text("Go To the MainSecondView")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundColor(.black)
                        .background(Color.yellow)
                        .cornerRadius(8.0)
                        .padding()
                })
                
                Spacer()
                
                Button(action: {
                    coordinator.changeTab(tabType: .settings)
                }, label: {
                    Text("Go to the SettingsView")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundColor(.black)
                        .background(Color.yellow)
                        .cornerRadius(8.0)
                        .padding()
                })
            }
        }
        .navigationTitle("Main First View")
        .onAppear {
            print("onAppear MainFirstView")
        }
        .onDisappear {
            print("onDisappear MainFirstView")
        }
    }
}

struct MainSecondView<Coordinator>: View where Coordinator: MainCoordinatorProtocol {
    
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Button(action: {
                coordinator.isRootActive.toggle()
            }, label: {
                Text("Close")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .cornerRadius(8.0)
                    .padding()
            })
            Spacer()
            Button(action: {
                coordinator.changeTab(tabType: .account)
            }, label: {
                Text("Go to the Account Tab")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .cornerRadius(8.0)
                    .padding()
            })
            
        }
        .navigationTitle("Main Second View")
        .onAppear {
            print("onAppear MainSecondView")
        }
        .onDisappear {
            print("onDisappear MainSecondView")
        }
    }
}

#Preview {
    MainView(coordinator: MainCoordinator())
}
