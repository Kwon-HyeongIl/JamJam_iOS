//
//  NavigationTitleAndHomeModifier.swift
//  Jamjam
//
//  Created by 권형일 on 6/18/25.
//

import SwiftUI

// 타이틀 + 홈 이동
struct NavigationTitleAndHomeModifier: ViewModifier {
    @Environment(NavigationRouter.self) var navRouter
    @Environment(MainTabBarCapsule.self) var mainTabBarCapsule
    
    let title: String
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        navRouter.popToRoot()
                        mainTabBarCapsule.selectedTab = .home
                    } label: {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .foregroundStyle(Color.JJTitle)
                    }
                } 
            }
    }
}
