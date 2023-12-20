//
//  CheckerView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/18/23.
//

import SwiftUI

struct CheckerView: View {
    @ObservedObject var viewModel: CheckerViewModel = CheckerViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                viewModel.checkAll()
            }, label: {
                HStack {
                    Image(systemName: viewModel.isCheckAll ? "checkmark" : "")
                        .resizable()
                        .frame(width: 13, height: 13)
                        .padding(4)
                        .overlay(
                            Rectangle()
                                .stroke(.gray)
                        )
                    Text("Agree All")
                }
            })
            
            Button(action: {
                viewModel.isFirstChecked.toggle()
            }, label: {
                HStack {
                    Image(systemName: viewModel.isFirstChecked ? "checkmark" : "")
                        .resizable()
                        .frame(width: 13, height: 13)
                        .padding(4)
                        .overlay(
                            Rectangle()
                                .stroke(.gray)
                        )
                    Text("Fisrt")
                }
            })
            
            Button(action: {
                viewModel.isSecondChecked.toggle()
            }, label: {
                HStack {
                    Image(systemName: viewModel.isSecondChecked ? "checkmark" : "")
                        .resizable()
                        .frame(width: 13, height: 13)
                        .padding(4)
                        .overlay(
                            Rectangle()
                                .stroke(.gray)
                        )
                    Text("Second")
                }
            })
            
            Button(action: {
                viewModel.isThirdChecked.toggle()
            }, label: {
                HStack {
                    Image(systemName: viewModel.isThirdChecked ? "checkmark" : "")
                        .resizable()
                        .frame(width: 13, height: 13)
                        .padding(4)
                        .overlay(
                            Rectangle()
                                .stroke(.gray)
                        )
                    Text("Third")
                }
            })
            
            Button(action: {
                print("Next button")
            }, label: {
                Text("Next Button")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .bold()
                    .foregroundStyle(.white)
                    .background(.black)
                    .cornerRadius(8)
                    .padding()
            })
            .disabled(!viewModel.isCheckAll)
        }
    }
}

#Preview {
    CheckerView()
}
