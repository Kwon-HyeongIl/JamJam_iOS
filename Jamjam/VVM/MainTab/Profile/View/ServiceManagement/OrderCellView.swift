//
//  SwiftUIView.swift
//  Jamjam
//
//  Created by 권형일 on 7/15/25.
//

import SwiftUI

struct OrderCellView: View {
    let orderCell: OrderCellDomainModel?
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(orderCell?.title ?? "")
                    .font(.pretendard(Pretendard.semiBold, size: 18))
                    .padding(.leading, 20)
                
                Spacer()
            }
            
            HStack {
                Text(orderCell?.client ?? "")
                    .font(.pretendard(Pretendard.medium, size: 16))
                    .padding(.leading, 20)
                
                Spacer()
                
                Text(orderCell?.orderedAt ?? "")
                    .font(.pretendard(size: 15))
                    .foregroundStyle(.gray)
                    .padding(.trailing, 20)
            }
            
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(Color.mainBackground)
    }
}

#Preview {
    OrderCellView(orderCell: nil)
}
