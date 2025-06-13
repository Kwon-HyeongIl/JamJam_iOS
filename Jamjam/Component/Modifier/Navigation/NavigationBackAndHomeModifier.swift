//
//  NavigationBackAndHomeModifier.swift
//  Jamjam
//
//  Created by 권형일 on 6/13/25.
//

import SwiftUI

// 뒤로가기 + 홈 이동
struct NavigationBackAndHomeModifier: ViewModifier {
    @Environment(NavigationRouter.self) var navRouter
//    @Environment(MainTabCapsule.self) var mainTabCapsule
    
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
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        navRouter.popToRoot()
//                        mainTabCapsule.selectedTab = .home
                    } label: {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
//                            .foregroundStyle(Color.)
                    }
                }
            }
    }
}
