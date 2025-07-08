//
//  ChatCellView.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import SwiftUI

struct ChatCellView: View {
    let chatRoom: ChatRoomDomainModel
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 50))
                .foregroundStyle(.gray.opacity(0.6))
                .padding(.leading, 20)
            
            VStack(alignment: .leading, spacing: 7) {
                Text(chatRoom.nickname)
                    .font(.pretendard(Pretendard.semiBold, size: 17))
                
                Text(chatRoom.lastMessage)
                    .font(.pretendard(Pretendard.regular, size: 14))
                    .frame(maxWidth: 150, alignment: .leading)
                    .lineLimit(1)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                ZStack {
                    Text(chatRoom.lastMessageRelativeTime)
                        .font(.pretendard(Pretendard.regular, size: 12))
                        .foregroundStyle(.gray)
                        .padding(.bottom, 18)
                    
                    if chatRoom.unreadCount >= 1 {
                        Circle()
                            .fill(Color.JJTitle)
                            .scaledToFit()
                            .frame(width: 18)
                            .overlay {
                                Text("\(chatRoom.unreadCount)")
                                    .font(.pretendard(Pretendard.semiBold, size: 11))
                                    .foregroundStyle(.white)
                            }
                            .padding(.top, 25)
                    }
                }
            }
            .padding(.trailing, 20)
        }
        .background(Color.mainBackground)
        .frame(maxWidth: .infinity)
        .frame(height: 80)
    }
}

#Preview {
    ChatCellView(chatRoom: ChatRoomDomainModel(fromFetchChatRoomsResponse: .init(id: 0, nickname: "", lastMessage: "", lastMessageTime: "", unreadCount: 0, profileUrl: "")))
}
