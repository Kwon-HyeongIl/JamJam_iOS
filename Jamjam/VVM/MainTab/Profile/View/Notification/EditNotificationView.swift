//
//  EditNotificationView.swift
//  Jamjam
//
//  Created by 권형일 on 7/12/25.
//

import SwiftUI

struct EditNotificationView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = EditNotificationViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    VStack(alignment: .leading, spacing: 8) {
                        Toggle("공지사항 및 이벤트", isOn: $viewModel.eventNotification)
                            .font(.pretendard(size: 18))
                            .fontWeight(.medium)
                            .tint(Color.JJTitle)
                            .padding(.horizontal, 20)
                        
                        Text(viewModel.eventNotification ? "새로운 공지사항 또는 이벤트 진행 시 알림을 받을 수 있어요." : "새로운 공지사항이나 이벤트와 관련된 모든 알림을 받지 않아요.")
                            .font(.pretendard(size: 12))
                            .foregroundStyle(.gray)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 3)
                        
                        Divider()
                            .padding(.horizontal, 10)
                    }
                    .padding(.top, 15)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Toggle("주문 상태", isOn: $viewModel.orderNotification)
                            .font(.pretendard(size: 18))
                            .fontWeight(.medium)
                            .tint(Color.JJTitle)
                            .padding(.horizontal, 20)
                        
                        Text(viewModel.orderNotification ? "서비스 주문 과정의 모든 단계에 대한 알림을 받을 수 있어요." : "서비스 주문과 관련된 모든 알림을 받지 않아요.")
                            .font(.pretendard(size: 12))
                            .foregroundStyle(.gray)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 3)
                        
                        Divider()
                            .padding(.horizontal, 10)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Toggle("채팅", isOn: $viewModel.chatNotification)
                            .font(.pretendard(size: 18))
                            .fontWeight(.medium)
                            .tint(Color.JJTitle)
                            .padding(.horizontal, 20)
                        
                        Text(viewModel.chatNotification ? "채팅이 오면 알림을 받을 수 있어요." : "채팅과 관련된 모든 알림을 받지 않아요.")
                            .font(.pretendard(size: 12))
                            .foregroundStyle(.gray)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 3)
                        
                        Divider()
                            .padding(.horizontal, 10)
                    }
                }
            }
            .padding(.top, 1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleModifier(title: "알림 설정"))
    }
}

#Preview {
    NavigationStack {
        EditNotificationView()
            .environment(NavigationCore())
    }
}
