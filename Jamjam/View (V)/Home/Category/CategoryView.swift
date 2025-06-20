//
//  CategoryView.swift
//  Jamjam
//
//  Created by 권형일 on 6/20/25.
//

import SwiftUI

struct CategoryView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = CategoryViewModel()
    
    var body: some View {
        MainBackground {
            ScrollView(showsIndicators: false) {
                
            }
            .modifier(NavigationBarBackModifier())
        }
    }
}

#Preview {
    CategoryView()
        .environment(NavigationRouter())
}
