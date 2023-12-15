//
//  NavigationTestView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 2023/12/12.
//

import SwiftUI

struct NavigationTestView<Model>: View where Model: CoordinatorProtocol {
    @ObservedObject private var coordinator: Model
    
    init(coordinator: Model) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: PageTwo(coordinator: coordinator),
                isActive: $coordinator.isRootActive
            ) {
                Text("Go to Page Two")
            }
            .navigationTitle("NavigationView")
            .navigationViewStyle(.stack)
        }
    }
}


struct PageTwo<Model>: View where Model: CoordinatorProtocol {
    @ObservedObject var coordinator: Model
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Prev")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.blue)
                    .background(Color.yellow)
                    .padding()
            })
            Spacer()
            NavigationLink(
                destination: PageThree(coordinator: coordinator)
            ) {
                Text("Go to Page Three")
            }
        }
        .navigationTitle("Page Two")
        .onAppear {
            print("On page two isRootActive state: \(coordinator.isRootActive)")
        }
    }
}

struct PageThree<Model>: View where Model: CoordinatorProtocol {
    @ObservedObject var coordinator: Model
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Prev")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.blue)
                    .background(Color.yellow)
                    .padding()
            })
            
            Spacer()
            
            Button(action: {
                coordinator.moveToRoot()
            }, label: {
                Text("Back to root!")
            })
        }
        .navigationTitle("Page Three")
        .onAppear {
            print("On page three isRootActive state: \(coordinator.isRootActive)")
        }
    }
}

#Preview {
    NavigationTestView(coordinator: Coordinator())
}
