//
//  OrderServiceView.swift
//  Jamjam
//
//  Created by 권형일 on 7/12/25.
//

import SwiftUI

struct OrderServiceView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = OrderServiceViewModel()
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleAndHomeModifier(title: "서비스 주문", isEntireProgressVisible: $viewModel.isEntireProgressViewVisible))
        .blur(radius: viewModel.isEntireProgressViewVisible ? 2.0 : 0)
        .overlay {
            if viewModel.isEntireProgressViewVisible {
                VStack {
                    ProgressView()
                        .scaleEffect(1.5)
                        .tint(Color.JJTitle)
                        .padding(.bottom, 30)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.gray.opacity(0.5))
            }
        }
        .alert("주문 실패", isPresented: $viewModel.isOrderAlertVisible) {
            Button {
                viewModel.orderAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
            } label: {
                Text("확인")
            }
        } message: {
            Text(viewModel.orderAlertMessage)
        }
        .onTapGesture {
            focus = nil
        }
    }
}

#Preview {
    NavigationStack {
        OrderServiceView()
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
