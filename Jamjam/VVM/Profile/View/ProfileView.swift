//
//  ProfileView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI
import WebKit

struct ProfileView: View {
    @Environment(NavigationCore.self) var navRouter
    
    @State private var editorContent = ""
    
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
            
            
            ScrollView(showsIndicators: false) {
                WebView(html: $editorContent)
                    .frame(height: 570)
//                VStack(spacing: 30) {
//                    Button {
//                        AuthCenter.shared.logout()
//                    } label: {
//                        Text("로그아웃")
//                    }
//                    
//                    Button {
//                        navRouter.navigate(.providerProfileView)
//                    } label: {
//                        Text("llioopv의 프로필")
//                    }
//                    
//                    Button {
//                        navRouter.navigate(.providerProfileEditListView)
//                    } label: {
//                        Text("ProviderProfileEditListView")
//                    }
//                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
    }
    
    
}

#Preview {
    ProfileView()
        .environment(NavigationCore())
}
