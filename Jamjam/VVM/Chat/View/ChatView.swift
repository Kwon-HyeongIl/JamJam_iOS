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
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.chatRooms) { chatRoom in
                        ChatCellView(chatRoom: chatRoom)
                            .onTapGesture {
                                navRouter.navigate(.chatContentView(chatRoom))
                            }
                    }
                }
            }
            .onAppear {
                viewModel.fetchChatRooms()
                
                if viewModel.isStompClientInitPossible {
                    viewModel.initStompClient()
                }
            }
        }
    }
}

#Preview {
    ChatView()
        .environment(NavigationRouter())
}
