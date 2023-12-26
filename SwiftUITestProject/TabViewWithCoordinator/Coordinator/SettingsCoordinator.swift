//
//  SettingsCoordinator.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/21/23.
//

import Foundation

protocol SettingsCoordinatorProtocol: ObservableObject {
    var coordinator: TabViewCoordinator { get set }
    var isRootActive: Bool { get set }
    func changeTab(tabType: TabViewType)
}

class SettingsCoordinator {
    @Published var coordinator: TabViewCoordinator
    @Published var isRootActive: Bool = false
    
    init(coordinator: TabViewCoordinator) {
        self.coordinator = coordinator
    }
}

extension SettingsCoordinator: SettingsCoordinatorProtocol {
    func changeTab(tabType: TabViewType) {
        coordinator.tabViewType = tabType
    }
}
