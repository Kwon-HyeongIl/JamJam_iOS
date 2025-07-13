//
//  NavigationBarBackAndLogoAndLoginButtonModifier.swift
//  Jamjam
//
//  Created by 권형일 on 7/1/25.
//

import SwiftUI

// 뒤로가기 + 로고 + 로그인
struct NavigationBarBackAndLogoAndLoginButtonModifier: ViewModifier {
    @Environment(NavigationCore.self) var navRouter
    
    var isEntireProgressVisible: Binding<Bool>?
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground((isEntireProgressVisible?.wrappedValue ?? false) ? .clear : Color.mainBackground, for: .navigationBar)
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
                            .blur(radius: (isEntireProgressVisible?.wrappedValue ?? false) ? 2.0 : 0)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Image("jamjam_main_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45)
                        .blur(radius: (isEntireProgressVisible?.wrappedValue ?? false) ? 2.0 : 0)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        navRouter.navigate(.loginView)
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 64, height: 30)
                            .foregroundStyle(Color.JJTitle)
                            .overlay {
                                Text("로그인")
                                    .font(.pretendard(Pretendard.semiBold, size: 14))
                                    .foregroundStyle(.white)
                            }
                            .blur(radius: (isEntireProgressVisible?.wrappedValue ?? false) ? 2.0 : 0)
                    }
                }
            }
    }
}
