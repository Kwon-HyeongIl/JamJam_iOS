//
//  NavigationBarBackAndTitleAndHomeModifier.swift
//  Jamjam
//
//  Created by 권형일 on 6/30/25.
//

import SwiftUI

// 뒤로가기 + 타이틀 + 홈
struct NavigationBarBackAndTitleAndHomeModifier: ViewModifier {
    @Environment(NavigationCore.self) var navRouter
    @Environment(MainTabBarCapsule.self) var mainTabBarCapsule
    
    let title: String
    
    init(title: String) {
        self.title = title
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.mainBackground)
        appearance.shadowColor = .clear // 하단 Divider 제거
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
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
                        .font(.pretendard(Pretendard.semiBold, size: 18))
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        navRouter.popToRoot()
                        mainTabBarCapsule.selectedTab = .home
                    } label: {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                            .foregroundStyle(Color.JJTitle)
                    }
                } 
            }
    }
}
