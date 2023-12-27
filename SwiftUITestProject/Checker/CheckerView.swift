//
//  CheckerView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/18/23.
//

import SwiftUI

struct CheckerView<Model>: View where Model: CheckerViewModelProtocol {
    
    @ObservedObject var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                viewModel.checkAll()
            }, label: {
                Image(systemName: viewModel.isCheckAll ? "checkmark" : "")
                    .resizable()
                    .frame(width: 13, height: 13)
                    .padding(4)
                    .overlay(
                        Rectangle()
                            .stroke(.gray)
                    )
                Text("전체 동의")
            })
            
            VStack(alignment: .leading) {
                Text(viewModel.topItemView.title)
                ForEach(Array(viewModel.topItemView.content.enumerated()), id: \.element.id) { index, value in
                    Button(action: {
                        viewModel.topItemView.content[index].isCheck.toggle()
                    }, label: {
                        Image(systemName: value.isCheck ? "checkmark" : "")
                            .resizable()
                            .frame(width: 13, height: 13)
                            .padding(4)
                            .overlay(
                                Rectangle()
                                    .stroke(.gray)
                            )
                        Text(value.content)
                    })
                }
            }
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                ForEach(Array(viewModel.bottomItemView.enumerated()), id:\.element.id) { index, item in
                    Text(item.title)
                    Button(action: {
                        viewModel.bottomItemView[index].isCheck.toggle()
                    }, label: {
                        Image(systemName: item.isCheck ? "checkmark" : "")
                            .resizable()
                            .frame(width: 13, height: 13)
                            .padding(4)
                            .overlay(
                                Rectangle()
                                    .stroke(.gray)
                            )
                        Text(item.content)
                    })
                    .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    CheckerView(viewModel: CheckerViewModel())
}
