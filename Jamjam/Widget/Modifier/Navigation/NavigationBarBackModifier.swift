//
//  NavigationBackModifier.swift
//  Jamjam
//
//  Created by 권형일 on 6/13/25.
//

import SwiftUI

// 뒤로가기
struct NavigationBarBackModifier: ViewModifier {
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
            }
    }
}
