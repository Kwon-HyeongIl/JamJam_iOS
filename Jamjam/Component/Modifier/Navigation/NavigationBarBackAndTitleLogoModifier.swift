//
//  NavigationBarBackAndTitleLogoModifier.swift
//  Jamjam
//
//  Created by 권형일 on 6/20/25.
//

import SwiftUI

// 뒤로가기 + 로고
struct NavigationBarBackAndTitleLogoModifier: ViewModifier {
    @Environment(NavigationRouter.self) var navRouter
    
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
                    Image("jamjam_main_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45)
                }
            }
    }
}
