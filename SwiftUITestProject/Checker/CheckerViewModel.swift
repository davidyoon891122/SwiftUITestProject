//
//  CheckerViewModel.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/18/23.
//

import Foundation
import Combine

class CheckerViewModel: ObservableObject {
    @Published var isCheckAll: Bool = false
    @Published var isFirstChecked: Bool = false
    @Published var isSecondChecked: Bool = false
    @Published var isThirdChecked: Bool = false
    
    private var cancellables: [AnyCancellable] = []
    
    init() {
        Publishers.CombineLatest3($isFirstChecked, $isSecondChecked, $isThirdChecked)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] first, second, third in
                print(first && second && third)
                self?.isCheckAll = first && second && third
            }
            .store(in: &cancellables)
    }
    
    
    func checkAll() {
        print("isMain: \(Thread.isMainThread)")
        isFirstChecked = !isCheckAll
        isSecondChecked = !isCheckAll
        isThirdChecked = !isCheckAll
    }
}
