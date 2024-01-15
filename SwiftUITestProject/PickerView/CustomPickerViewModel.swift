//
//  CustomPickerViewModel.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 1/2/24.
//

import Foundation


struct PickerItem {
    
    var code: String
    var name: String
    
}

extension PickerItem: Hashable {
    
}

extension PickerItem {
    static let item: [Self] = [
        PickerItem(code: "01", name: "일번"),
        PickerItem(code: "02", name: "이번")
    ]
}

class CustomPickerViewModel: ObservableObject {
    
    @Published var pickerItem: [PickerItem] = []
    var selectedItem: PickerItem = .init(code: "", name: "")
    
    
    func requestPickerItem() {
        self.pickerItem = PickerItem.item
        self.selectedItem = pickerItem.first ?? .init(code: "", name: "")
    }
    
}
