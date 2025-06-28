//
//  ChatCellView.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import SwiftUI

struct ChatCellView: View {
    // 객체 받기
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .font(.system(size: 50))
                .foregroundStyle(.gray)
                .padding(.leading, 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("홍길동")
                    .font(.pretendard(Pretendard.semiBold, size: 17))
                
                Text("안녕하세요~")
                    .font(.pretendard(Pretendard.regular, size: 14))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("5시간 전")
                    .font(.pretendard(Pretendard.regular, size: 12))
                    .foregroundStyle(.gray)
                
                Circle()
                    .fill(Color.JJTitle)
                    .scaledToFit()
                    .frame(width: 20)
                    .overlay {
                        Text("3")
                            .font(.pretendard(Pretendard.semiBold, size: 12))
                            .foregroundStyle(.white)
                    }
            }
            .padding(.trailing, 20)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 90)
        .background(Color.mainBackground)
    }
}

#Preview {
    ChatCellView()
}
