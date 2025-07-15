//
//  ProviderPreparingOrderView.swift
//  Jamjam
//
//  Created by 권형일 on 7/16/25.
//

import SwiftUI

struct ProviderPreparingOrderView: View {
    @Environment(NavigationCore.self) var navRouter
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                
            }
            .padding(.top, 1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndHomeModifier())
    }
}

#Preview {
    ProviderPreparingOrderView()
        .environment(NavigationCore())
        .environment(MainTabBarCapsule())
}
