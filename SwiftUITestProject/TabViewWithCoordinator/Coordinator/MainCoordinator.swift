//
//  MainCoordinator.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/21/23.
//

import Foundation
import Combine

protocol MainCoordinatorProtocol: ObservableObject {
    var isRootActive: Bool { get set }
    var pushCoordinator: PassthroughSubject<any MainCoordinatorProtocol, Never> { get set }
    func changeTab(tabType: TabViewType)
}

class MainCoordinator {
    
    internal var id: UUID
    @Published var isRootActive: Bool = false
    
    var pushCoordinator: PassthroughSubject<any MainCoordinatorProtocol, Never> = .init()
    
    init() {

        self.id = UUID()
    }
    
    func showMainView() {
        pushCoordinator.send(MainCoordinator())
    }
}

extension MainCoordinator: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MainCoordinator, rhs: MainCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
}

extension MainCoordinator: MainCoordinatorProtocol {
    
    func changeTab(tabType: TabViewType) {
    }
    
}
