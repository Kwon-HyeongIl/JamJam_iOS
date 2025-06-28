//
//  ChatContentView.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import SwiftUI

struct ChatContentView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = ChatContentViewModel()
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        MainBackground {
            ScrollView(showsIndicators: false) {
                
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
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        navRouter.back()
                    } label: {
                        Image(systemName: "chevron.left")
                            .scaledToFit()
                            .frame(width: 24)
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 20))
                            .foregroundStyle(.gray)
                        
                        Text("홍길동")
                            .font(.pretendard(Pretendard.semiBold, size: 19))
                    }
                }
            }
        }
    }
}

#Preview {
    ChatContentView()
        .environment(NavigationRouter())
}
