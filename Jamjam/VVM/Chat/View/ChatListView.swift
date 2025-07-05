//
//  ChatView.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import SwiftUI

struct ChatListView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = ChatListViewModel()
    
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
                        ForEach(viewModel.chatRooms, id: \.roomId) { chatRoom in
                            ChatCellView(chatRoom: chatRoom)
                                .onTapGesture {
                                    navRouter.navigate(.chatContentView(chatRoom))
                                }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    ChatListView()
        .environment(NavigationRouter())
}
