//
//  SplashView.swift
//  Jamjam
//
//  Created by 권형일 on 6/9/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Image("jamjam_main_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
    }
}

#Preview {
    SplashView()
}
