//
//  NavigationTestView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 2023/12/12.
//

import SwiftUI

struct NavigationTestView: View {
    @State var isActive: Bool = false
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: PageTwo(rootIsActive: $isActive),
                isActive: $isActive
            ) {
                Text("Go to Page Two")
            }
            .navigationTitle("NavigationView")
        }
    }
}


struct PageTwo: View {
    @Binding var rootIsActive: Bool
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
                destination: PageThree(rootIsActive: $rootIsActive)
            ) {
                Text("Go to Page Three")
            }
        }
        .navigationTitle("Page Two")
    }
}

struct PageThree: View {
    @Binding var rootIsActive: Bool
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
                rootIsActive = false
            }, label: {
                Text("Back to root!")
            })
        }
        .navigationTitle("Page Three")
    }
}

#Preview {
    NavigationTestView()
}
