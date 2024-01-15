//
//  CustomPickerView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 1/2/24.
//

import SwiftUI

struct CustomPickerView: View {
    
    @ObservedObject var viewModel = CustomPickerViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    print(viewModel.selectedItem)
                }, label: {
                    Text("Done")
                        
                })
                .padding(.horizontal, 20)
                .padding(.vertical)
            }
            Picker("JoinInfo", selection: $viewModel.selectedItem) {
                ForEach(viewModel.pickerItem, id: \.self) { item in
                    Text(item.name)
                        .tag(item)
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 216)
        }
        .onAppear {
            viewModel.requestPickerItem()
        }
    }
}

#Preview {
    CustomPickerView()
}
