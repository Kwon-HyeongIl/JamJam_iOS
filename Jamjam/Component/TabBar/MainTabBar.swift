//
//  CustomTabView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct MainTabBar: View {
    @Environment(MainTabBarCapsule.self) var mainTabBarCapsule
    
    private var fillImage: String {
        mainTabBarCapsule.selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        @Bindable var mainTabBarCapsule = mainTabBarCapsule
        
        VStack {
            HStack {
                ForEach(MainTab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    
                    VStack {
                        Image(systemName: mainTabBarCapsule.selectedTab == tab ? fillImage : tab.rawValue)
                            .scaleEffect(mainTabBarCapsule.selectedTab == tab ? 1.25 : 1.0)
                            .foregroundStyle(mainTabBarCapsule.selectedTab == tab ? Color.JJTitle : .black)
                            .font(.system(size: 19))
                            .padding(.bottom, 1)
                            .padding(.top, 10)
                    }
                    .padding(.top, 10)
                    .onTapGesture {
                        // 햅틱
                        let view = UIView(frame: .zero)
                        UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                        
                        withAnimation(.easeInOut(duration: 0.05)) {
                            mainTabBarCapsule.selectedTab = tab
                        }
                    }
                    .padding(.bottom, 5)
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        .frame(height: 150)
        .background(.regularMaterial)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: -2)
    }
}

#Preview {
    MainTabBar()
        .environment(MainTabBarCapsule())
}
