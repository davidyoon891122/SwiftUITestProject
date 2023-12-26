//
//  AccountCoordinator.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/21/23.
//

import Foundation

protocol AccountCoordinatorProtocol: ObservableObject {
    var coordinator: TabViewCoordinator { get set }
    var isRootActive: Bool { get set }
    var isMoveSecondView: Bool { get set }
    
    func changeTab(tabType: TabViewType)
    func moveToSecondView()
}

class AccountCoordinator {
    @Published var coordinator: TabViewCoordinator
    @Published var isRootActive: Bool = false
    @Published var isMoveSecondView: Bool = false
    
    init(coordinator: TabViewCoordinator) {
        self.coordinator = coordinator
    }
}

extension AccountCoordinator: AccountCoordinatorProtocol {
    func changeTab(tabType: TabViewType) {
        coordinator.tabViewType = tabType
    }
    
    func moveToSecondView() {
        print("AccountCoordinator moveToSecondView: \(isMoveSecondView)")
        isMoveSecondView = true
        isRootActive = true
    }
}
