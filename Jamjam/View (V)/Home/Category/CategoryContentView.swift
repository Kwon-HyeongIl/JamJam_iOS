//
//  CategoryContentView.swift
//  Jamjam
//
//  Created by 권형일 on 6/20/25.
//

import SwiftUI

struct CategoryContentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 100, height: 100)
            .foregroundStyle(.gray)
        
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 100, height: 100)
            .foregroundStyle(.gray)
    }
}

#Preview {
    CategoryContentView()
}
