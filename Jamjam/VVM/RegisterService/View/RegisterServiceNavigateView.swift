//
//  RegisterServiceBaseView.swift
//  Jamjam
//
//  Created by 권형일 on 7/11/25.
//

import SwiftUI

struct RegisterServiceNavigateView: View {
    @Environment(NavigationCore.self) var navRouter
    
    var body: some View {
        VStack(spacing: 0) {}
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .onAppear {
            navRouter.navigate(.registerServiceLeadView)
        }
    }
}

#Preview {
    RegisterServiceNavigateView()
        .environment(NavigationCore())
}
