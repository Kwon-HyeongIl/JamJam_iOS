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
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        Text("프로필")
                            .font(.pretendard(Pretendard.semiBold, size: 25))
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                }
                .frame(height: 50)
                .background(Color.mainBackground)
            }
            
            VStack(spacing: 30) {
                Button {
                    AuthCenter.shared.logout()
                } label: {
                    Text("로그아웃")
                }
                
                Button {
                    navRouter.navigate(.providerProfileView)
                } label: {
                    Text("llioopv의 프로필")
                }
            }
        }
        .background(Color.mainBackground)
    }
}

#Preview {
    ProfileView()
        .environment(NavigationRouter())
}
