//
//  ChatContentView.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import SwiftUI

struct ChatContentView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel: ChatContentViewModel
    
    @FocusState private var focus: TextFieldFocusField?
    
    init(chatRoom: ChatRoom) {
        viewModel = ChatContentViewModel(chatRoom: chatRoom)
    }
    
    var body: some View {
        MainBackground {
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(viewModel.messages) { message in
                        HStack {
                            if message.isOwn { // 내 채팅
                                Spacer()
                                
                                VStack {
                                    Spacer()
                                    
                                    Text("\(message.sentAt)")
                                        .font(.pretendard(Pretendard.regular, size: 8))
                                        .foregroundStyle(.gray)
                                }
                                
                                VStack {
                                    Text(message.content)
                                        .font(.pretendard(Pretendard.medium, size: 14))
                                        .foregroundStyle(.white)
                                        .padding()
                                }
                                .background(Color.JJTitle)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                              
                            } else { // 상대 채팅
                                VStack {
                                    Text(message.content)
                                        .font(.pretendard(Pretendard.medium, size: 14))
                                        .foregroundStyle(.black)
                                        .padding()
                                }
                                .background(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                                VStack {
                                    Spacer()
                                    
                                    Text("\(message.sentAt)")
                                        .font(.pretendard(Pretendard.regular, size: 8))
                                        .foregroundStyle(.gray)
                                }
                                
                                Spacer()
                            }
                        }
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0) {
                    Divider()
                        
                    Spacer()
                    
                    HStack {
                        TextField("메시지를 입력하세요.", text: $viewModel.chatMessage, axis: .vertical)
                            .focused($focus, equals: .first)
                            .lineLimit(1...5)
                            .font(.pretendard(Pretendard.regular, size: 15))
                            .padding(12)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(focus == .first ? Color.JJTitle : .gray.opacity(0.5),
                                            lineWidth: focus == .first ? 1.5 : 1)
                            )
                        
                        Button {
                            viewModel.send()
                            print("send")
                        } label: {
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 23))
                                .foregroundStyle(viewModel.chatMessage.isEmpty ? .gray : Color.JJTitle)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                .frame(height: 60)
            }
            .modifier(NavigationBarBackAndNameModifier(name: "홍길동"))
        }
    }
}

#Preview {
    NavigationStack {
        ChatContentView(chatRoom: ChatRoom(id: 0, nickname: "", lastMessage: "", lastMessageTime: "", unreadCount: 0, profileUrl: ""))
            .environment(NavigationRouter())
    }
}
