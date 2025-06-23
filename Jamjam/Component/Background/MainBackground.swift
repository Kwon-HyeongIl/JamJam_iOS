//
//  MainBackground.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct MainBackground<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.mainBackground
            .ignoresSafeArea()
            
            content
        }
    }
}

#Preview {
    MainBackground() {
        Text("")
    }
}
