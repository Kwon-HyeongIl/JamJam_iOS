//
//  NavigationBarBackAndProfileAndEditModifier.swift
//  Jamjam
//
//  Created by 권형일 on 7/3/25.
//

import SwiftUI

struct NavigationBarBackAndProfileAndEditModifier: ViewModifier {
    @Environment(NavigationRouter.self) var navRouter
    
    let nickname: String
    
    @Binding var isEdditButtonTapped: Bool
    
    init(nickname: String, isEdditButtonTapped: Binding<Bool>) {
        self.nickname = nickname
        self._isEdditButtonTapped = isEdditButtonTapped
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.mainBackground)
        appearance.shadowColor = .clear // 하단 Divider 제거
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        navRouter.back()
                    } label: {
                        Image(systemName: "chevron.left")
                            .scaledToFit()
                            .frame(width: 24)
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.gray.opacity(0.6))
                        
                        Text(nickname)
                            .font(.pretendard(Pretendard.semiBold, size: 18))
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button {
                            isEdditButtonTapped = true
                        } label: {
                            Text("채팅방 나가기")
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 20))
                            .foregroundStyle(.gray)
                    }
                }
            }
    }
}
