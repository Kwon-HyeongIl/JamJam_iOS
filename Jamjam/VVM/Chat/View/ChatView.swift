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
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        Text("채팅")
                            .font(.pretendard(Pretendard.semiBold, size: 25))
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                }
                .frame(height: 50)
                .background(Color.mainBackground)
                
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
            }
        }
        .background(Color.mainBackground)
        .onAppear {
            viewModel.fetchChatRooms()
            
            if viewModel.isStompClientInitPossible {
                viewModel.initStompClient()
            }
        }
    }
}

#Preview {
    ChatView()
        .environment(NavigationRouter())
}
