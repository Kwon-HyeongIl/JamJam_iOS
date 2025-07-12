//
//  CustomTabView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct MainTabBar: View {
    @Environment(NavigationCore.self) var navRouter
    @Environment(MainTabBarCapsule.self) var mainTabBarCapsule
    
    let isCategoryView: Bool
    
    private var fillImage: String {
        mainTabBarCapsule.selectedTab.rawValue + "_tint"
    }
    
    var body: some View {
        @Bindable var mainTabBarCapsule = mainTabBarCapsule
        
        VStack {
            HStack {
                ForEach(MainTab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    
                    VStack {
                        Image(mainTabBarCapsule.selectedTab == tab ? fillImage : tab.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 19)
//                            .scaleEffect(mainTabBarCapsule.selectedTab == tab ? 1.25 : 1.0)
                    }
                    .padding(.top, 15)
                    .onTapGesture {
                        // 햅틱
                        let view = UIView(frame: .zero)
                        UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                        
                        withAnimation(.easeInOut(duration: 0.05)) {
                            if isCategoryView {
                                navRouter.popToRoot()
                            }
                            mainTabBarCapsule.selectedTab = tab
                        }
                    }
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        .frame(height: 150)
        .background(Color.mainBackground)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(color: .gray.opacity(0.1), radius: 5, x: 0, y: -5)
    }
}

#Preview {
    MainTabBar(isCategoryView: false)
        .environment(NavigationCore())
        .environment(MainTabBarCapsule())
}
