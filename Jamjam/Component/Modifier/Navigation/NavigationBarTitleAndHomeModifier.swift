//
//  NavigationTitleAndHomeModifier.swift
//  Jamjam
//
//  Created by 권형일 on 6/18/25.
//

import SwiftUI

// 타이틀 + 홈 이동
struct NavigationBarTitleAndHomeModifier: ViewModifier {
    @Environment(NavigationCore.self) var navRouter
    @Environment(MainTabBarCapsule.self) var mainTabBarCapsule
    
    let title: String
    var isEntireProgressVisible: Binding<Bool>?
    
    init(title: String, isEntireProgressVisible: Binding<Bool>? = nil) {
        self.title = title
        self.isEntireProgressVisible = isEntireProgressVisible
        
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
            .toolbarBackground((isEntireProgressVisible?.wrappedValue ?? false) ? .clear : Color.mainBackground, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.pretendard(Pretendard.semiBold, size: 18))
                        .blur(radius: (isEntireProgressVisible?.wrappedValue ?? false) ? 1.0 : 0)
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
                            .blur(radius: (isEntireProgressVisible?.wrappedValue ?? false) ? 1.0 : 0)
                    }
                } 
            }
    }
}
