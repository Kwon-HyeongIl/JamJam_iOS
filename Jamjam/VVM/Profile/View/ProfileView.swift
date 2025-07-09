//
//  ProfileView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

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
                VStack {
                    HStack {
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.gray.opacity(0.1))
                    .frame(height: 200)
                    .padding(.horizontal, 20)
                }

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
