//
//  ProviderProfileEditListView.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import SwiftUI

struct ProviderProfileEditListView: View {
    var body: some View {
        VStack(spacing: 0) {
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleModifier(title: "프로필 수정"))
    }
}

#Preview {
    ProviderProfileEditListView()
        .environment(NavigationRouter())
}
