//
//  TabViewCoordinator.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/21/23.
//

import Foundation
import Combine

enum TabViewType: Int {
    case main
    case account
    case settings
    
}

class TabViewCoordinator: ObservableObject {
    
    @Published var tabViewType: TabViewType = .main
    
    private var cancellables: Set<AnyCancellable> = []
    
    var mainCoordinator: (any MainCoordinatorProtocol)?
    
    var id: UUID
    
    init() {
        self.id = UUID()
    }
}

extension TabViewCoordinator {
    func moveToAccountSecondView() {
        
    }
    
    func mainFlow() {
        mainCoordinator = MainCoordinator()
        
    }
    
    func bind(mainCoordinator: any MainCoordinatorProtocol) {
        mainCoordinator.pushCoordinator
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { coordinator in
                
                
            })
            .store(in: &cancellables)
    }
    
}


