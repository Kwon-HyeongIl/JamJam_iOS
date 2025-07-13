//
//  NavigationBarRegisterServiceTailModifier.swift
//  Jamjam
//
//  Created by 권형일 on 7/12/25.
//

import SwiftUI

struct NavigationBarRegisterServiceTailModifier: ViewModifier {
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
                    HStack {
                        Text(title)
                            .font(.pretendard(Pretendard.semiBold, size: 18))
                        
                        Image("ai_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14)
                    }
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
