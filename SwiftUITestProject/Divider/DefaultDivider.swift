//
//  DefaultDivider.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/15/23.
//

import SwiftUI

struct DefaultDivider: View {
    var body: some View {
        VStack {
            Divider()
                .frame(height: 10)
                .background(.gray.opacity(0.2))
            
            Divider()
                .frame(minHeight: 10)
                .overlay(.gray.opacity(0.2))
            
            CustomDivider(direction: .horizontal)
        }
        
    }
}

#Preview {
    DefaultDivider()
}
