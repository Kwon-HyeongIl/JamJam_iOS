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
    
    init(chatRoom: ChatRoomModel) {
        viewModel = ChatContentViewModel(chatRoom: chatRoom)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(Array(viewModel.messages.enumerated()), id: \.element.messageId) { index, message in
                        let isSentDateVisible = (index == 0) || (message.sentDate != viewModel.messages[index - 1].sentDate)
                        
                        let isOhterUserProfileIconVisible = isSentDateVisible || (index == 0) || (viewModel.messages[index - 1].isOwn)
                        
                        let isSentDayTimeVisible = (index == 0) || (viewModel.messages[index - 1].isOwn != message.isOwn) || (viewModel.messages[index - 1].sentDayTime != message.sentDayTime)
                        
                        VStack(spacing: 0) {
                            if isSentDateVisible {
                                Text(message.sentDate)
                                    .font(.pretendard(Pretendard.regular, size: 11))
                                    .foregroundStyle(.gray)
                                    .padding(.top, index == 0 ? 3 : 10)
                            }
                            
                            // MARK: 내 채팅
                            if message.isOwn {
                                HStack(spacing: 2) {
                                    Spacer()
                                    
                                    if isSentDayTimeVisible {
                                        VStack {
                                            Spacer()
                                            
                                            Text("\(message.sentDayTime)")
                                                .font(.pretendard(Pretendard.regular, size: 8))
                                                .foregroundStyle(.gray)
                                                .padding(.bottom, 3)
                                        }
                                        .padding(.leading, 80)
                                    }
                                    
                                    VStack {
                                        Text(message.content)
                                            .font(.pretendard(Pretendard.medium, size: 15))
                                            .foregroundStyle(.white)
                                            .padding(12)
                                    }
                                    .background(Color.JJTitle)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .padding(.leading, isSentDayTimeVisible ? 0 : 100)
                                    .padding(.trailing, 10)
                                    
                                }
                                
                                // MARK: 상대방 채팅
                            } else {
                                HStack(spacing: 2) {
                                    if isOhterUserProfileIconVisible {
                                        Image(systemName: "person.crop.circle.fill")
                                            .font(.system(size: 34))
                                            .foregroundStyle(.gray.opacity(0.6))
                                            .padding(.leading, 10)
                                    }
                                    
                                    VStack {
                                        Text(message.content)
                                            .font(.pretendard(Pretendard.medium, size: 15))
                                            .foregroundStyle(.black)
                                            .padding(12)
                                    }
                                    .background(.gray.opacity(0.3))
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .padding(.leading, isOhterUserProfileIconVisible ? 0 : 52)
                                    .padding(.trailing, isSentDayTimeVisible ? 0 : 100)
                                    
                                    if isSentDayTimeVisible {
                                        VStack {
                                            Spacer()
                                            
                                            Text("\(message.sentDayTime)")
                                                .font(.pretendard(Pretendard.regular, size: 8))
                                                .foregroundStyle(.gray)
                                                .padding(.bottom, 3)
                                        }
                                        .padding(.trailing, 80)
                                    }
                                    
                                    Spacer()
                                }
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
        .modifier(NavigationBarBackAndProfileAndEditModifier(nickname: viewModel.chatRoom.nickname, isEdditButtonTapped: $viewModel.isEditButtonTapped))
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
        ChatContentView(chatRoom: ChatRoomModel(fromFetchChatRoomsResponse: .init(id: 0, nickname: "", lastMessage: "", lastMessageTime: "", unreadCount: 0, profileUrl: "")))
            .environment(NavigationRouter())
    }
}
