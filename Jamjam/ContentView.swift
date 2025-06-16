//
//  ContentView.swift
//  Jamjam
//
//  Created by 권형일 on 6/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isSplashVisible = true
    
    var body: some View {
        ZStack {
            MainTabView()
            
            if isSplashVisible {
                SplashView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                isSplashVisible = false
            }
        }
    }
}
