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
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(viewModel.messages, id: \.messageId) { message in
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
                        TextField("메시지를 입력하세요.", text: $viewModel.inputMessage, axis: .vertical)
                            .focused($focus, equals: .first)
                            .lineLimit(1...5)
                            .font(.pretendard(Pretendard.regular, size: 15))
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(focus == .first ? Color.JJTitle : .gray.opacity(0.2),
                                            lineWidth: focus == .first ? 1.5 : 1)
                            )
                        
                        Button {
                            viewModel.send()
                            print("send")
                        } label: {
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 23))
                                .foregroundStyle(viewModel.inputMessage.isEmpty ? .gray : Color.JJTitle)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                .frame(height: 60)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndProfileAndEditModifier(nickname: viewModel.chatRoom.nickname ?? "", isEdditButtonTapped: $viewModel.isEditButtonTapped))
        .alert("채팅방을 나가시겠습니까?", isPresented: $viewModel.isEditButtonTapped) {
            Button(role: .cancel) {
                
            } label: {
                Text("취소")
            }
            
            Button(role: .destructive) {
                viewModel.deleteChatRoom()
                navRouter.back()
            } label: {
                Text("나가기")
            }
        } message: {
            Text("채팅방 기록은 복구되지 않습니다.")
        }
        .alert("채팅방 나가기 실패", isPresented: $viewModel.isDeleteChatRoomAlertVisible) {
            Button {
                viewModel.deleteChatRoomAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
            } label: {
                Text("확인")
            }
        } message: {
            Text(viewModel.deleteChatRoomAlertMessage)
        }
        .onChange(of: viewModel.isChatRoomDeleted) { _, newValue in
            if newValue {
                navRouter.back()
            }
        }
        .onDisappear {
            viewModel.readLastMessage()
        }
    }
}

#Preview {
    NavigationStack {
        ChatContentView(chatRoom: ChatRoom(fromFetchChatRoomsResponse: .init(id: 0, nickname: "", lastMessage: "", lastMessageTime: "", unreadCount: 0, profileUrl: "")))
            .environment(NavigationRouter())
    }
}
