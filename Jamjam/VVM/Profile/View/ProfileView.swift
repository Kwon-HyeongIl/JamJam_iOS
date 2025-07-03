//
//  ProfileView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(NavigationRouter.self) var navRouter
    
    var body: some View {
        VStack(spacing: 30) {
            Button {
                AuthCenter.shared.logout()
            } label: {
                Text("로그아웃")
            }
        }
    }
}

#Preview {
    ProfileView()
}
