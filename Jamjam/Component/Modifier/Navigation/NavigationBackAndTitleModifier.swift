//
//  NavigationBackAndTitleModifier.swift
//  Jamjam
//
//  Created by 권형일 on 6/13/25.
//

import SwiftUI

// 뒤로가기 + 타이틀
struct NavigationBackAndTitleModifier: ViewModifier {
    @Environment(NavigationRouter.self) var navRouter
    
    let title: String
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        navRouter.back()
                    } label: {
                        Image(systemName: "chevron.left")
                            .scaledToFit()
                            .frame(width: 24)
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                }
            }
    }
}
