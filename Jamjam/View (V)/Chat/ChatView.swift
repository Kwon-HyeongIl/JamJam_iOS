//
//  ChatView.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import SwiftUI

struct ChatView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = ChatViewModel()
    
    var body: some View {
        MainBackground {
            ScrollView(showsIndicators: false) {
                Button {
//                    navRouter.navigate(.chatContentView)
                } label: {
                    Text("TT")
                }
            }
        }
    }
}

#Preview {
    ChatView()
        .environment(NavigationRouter())
}
