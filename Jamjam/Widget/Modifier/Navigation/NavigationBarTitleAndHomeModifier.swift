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
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground((isEntireProgressVisible?.wrappedValue ?? false) ? .clear : Color.mainBackground, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.pretendard(Pretendard.semiBold, size: 18))
                        .blur(radius: (isEntireProgressVisible?.wrappedValue ?? false) ? 2.0 : 0)
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
                            .blur(radius: (isEntireProgressVisible?.wrappedValue ?? false) ? 2.0 : 0)
                    }
                } 
            }
    }
}
