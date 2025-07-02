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
        VStack {
            Button {
                AuthCenter.shared.logout()
            } label: {
                Text("로그아웃")
            }
            
            Button {
                navRouter.navigate(.providerProfileView)
            } label: {
                Text("ProviderProfileView")
            }
            
            Button {
                navRouter.navigate(.chatContentView(JJUserModel(userId: "1", realName: "llioopv"), 1))
            } label: {
                Text("ChatContentView")
            }
        }
    }
}

#Preview {
    ProfileView()
}
