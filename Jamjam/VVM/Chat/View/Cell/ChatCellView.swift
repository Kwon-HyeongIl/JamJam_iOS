//
//  ChatCellView.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import SwiftUI

struct ChatCellView: View {
    let chatRoom: ChatRoom
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .font(.system(size: 50))
                .foregroundStyle(.gray)
                .padding(.leading, 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(chatRoom.nickname)
                    .font(.pretendard(Pretendard.semiBold, size: 17))
                
                Text(chatRoom.lastMessage ?? "")
                    .font(.pretendard(Pretendard.regular, size: 14))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(chatRoom.lastMessageTime ?? "")
                    .font(.pretendard(Pretendard.regular, size: 12))
                    .foregroundStyle(.gray)
                
                if chatRoom.unreadCount >= 1 {
                    Circle()
                        .fill(Color.JJTitle)
                        .scaledToFit()
                        .frame(width: 20)
                        .overlay {
                            Text("\(chatRoom.unreadCount)")
                                .font(.pretendard(Pretendard.semiBold, size: 12))
                                .foregroundStyle(.white)
                        }
                }
            }
            .padding(.trailing, 20)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(Color.mainBackground)
    }
}

#Preview {
    ChatCellView(chatRoom: ChatRoom(id: 0, nickname: "0", lastMessage: "0", lastMessageTime: "0", unreadCount: 0, profileUrl: "0"))
}
