//
//  CustomDivider.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 2023/12/07.
//

import SwiftUI

enum DividerDirection {
    case horizontal
    case vertical
}

struct CustomDivider: View {
    let color: Color
    let size: CGFloat
    let direction: DividerDirection
    
    init(color: Color, size: CGFloat, direction: DividerDirection) {
        self.color = color
        self.size = size
        self.direction = direction
    }
    
    var body: some View {
        switch direction {
        case .horizontal:
            color
                .frame(height: size)
        case .vertical:
            color
                .frame(width: size)
        }
    }
}

#Preview {
        CustomDivider(color: .gray, size: 1, direction: .horizontal)
}
