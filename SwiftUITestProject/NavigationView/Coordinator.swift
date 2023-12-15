//
//  Coordinator.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/15/23.
//

import Foundation

protocol CoordinatorProtocol: ObservableObject {
    var isRootActive: Bool { get set }
    func moveToRoot()
}

class Coordinator {
    @Published var isRootActive: Bool = false
}

extension Coordinator: CoordinatorProtocol {
    func moveToRoot() {
        isRootActive.toggle()
    }
}
