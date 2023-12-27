//
//  CheckerViewModel.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/18/23.
//

import Foundation
import Combine

struct TopItemView {
    
    var title: String
    var content: [TopItemContent]
    
    init(title: String, content: [TopItemContent]) {
        self.title = title
        self.content = content
    }
    
}

struct TopItemContent: Identifiable {
    
    let id = UUID()
    var content: String
    var isCheck: Bool
    
    init(content: String, isCheck: Bool) {
        self.content = content
        self.isCheck = isCheck
    }
    
}

struct BottomItemView: Identifiable {

    let id = UUID()
    var title: String
    var content: String
    var isCheck: Bool
    
    init(title: String, content: String, isCheck: Bool = false) {
        self.title = title
        self.content = content
        self.isCheck = isCheck
    }
    
}

protocol CheckerViewModelProtocol: ObservableObject {
    
    var isCheckAll: Bool { get set }
    
    var topItemView: TopItemView { get set }
    var bottomItemView: [BottomItemView] { get set }
    
    func checkAll()
    
    func updateCheckAll()
    
}

class CheckerViewModel {
    
    @Published var isCheckAll: Bool = false
    
    @Published var topItemView: TopItemView = .init(title: "1. 전문투자자 심사를 위한 신청정보 작성", content: [
        .init(content: "개인(신용)정보 수집• 이용 제공 동의", isCheck: false),
        .init(content: "고유식별정보 수집• 이용 제공 동의", isCheck: false)
    ]) {
        didSet {
            updateCheckAll()
        }
    }
    
    @Published var bottomItemView: [BottomItemView] = [
        .init(title: "2. 개인(신용)정보 수집• 이용 제공 동의", content: "개인(신용)정보 수집• 이용 제공 동의"),
        .init(title: "3. 유의사항", content: "개인전문투자자 분류확인")
    ] {
        didSet {
            updateCheckAll()
        }
    }
    
    private var cancellables: [AnyCancellable] = []
    
    init() {
        
        
    }
    
}

extension CheckerViewModel: CheckerViewModelProtocol {
    
    func checkAll() {
        topItemView.content.indices.forEach { index in
            topItemView.content[index].isCheck = !isCheckAll
        }
        
        bottomItemView.indices.forEach { index in
            bottomItemView[index].isCheck = !isCheckAll
        }
    }
    
    func updateCheckAll() {
        DispatchQueue.main.async {
            let checkAllTop = self.topItemView.content.allSatisfy({ $0.isCheck })
            let checkAllBotoom = self.bottomItemView.allSatisfy({ $0.isCheck })
            
            self.isCheckAll = checkAllTop && checkAllBotoom
        }
    }
    
}
