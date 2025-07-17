//
//  ClientRquestedOrderView.swift
//  Jamjam
//
//  Created by 권형일 on 7/17/25.
//

import SwiftUI

struct ClientRquestedOrderView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel: ClientRequestedOrderViewModel
    
    init(orderId: Int?) {
        viewModel = ClientRequestedOrderViewModel(orderId: orderId)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 40) {
                        VStack(spacing: 13) {
                            HStack {
                                Text("의뢰 제목")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text(viewModel.order?.title ?? "")
                                    .font(.pretendard(Pretendard.bold, size: 22))
                                    .padding(.horizontal, 20)
                                
                                Spacer()
                            }
                        }
                        .padding(.top, 10)
                        
                        VStack(spacing: 13) {
                            HStack {
                                Text("희망 마감일")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text(viewModel.order?.deadLine ?? "")
                                    .font(.pretendard(Pretendard.bold, size: 20))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                        }
                        
                        VStack(spacing: 13) {
                            HStack {
                                Text("의뢰 내용")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text(viewModel.order?.description ?? "")
                                    .font(.pretendard(Pretendard.bold, size: 18))
                                    .padding(.horizontal, 20)
                                
                                Spacer()
                            }
                        }
                        
                        VStack(spacing: 13) {
                            HStack {
                                Text("참고 자료")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 10) {
                                    ForEach(Array((viewModel.order?.referenceFiles ?? []).enumerated()), id: \.element.id) { index, image in
                                        AsyncImage(url: URL(string: image.url)) { state in
                                            switch state {
                                            case .empty:
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.gray.opacity(0.1))
                                                    .shimmering()
                                                
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                
                                            case .failure:
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.gray.opacity(0.1))
                                                
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                        .frame(width: proxy.size.width * 0.4, height: proxy.size.width * 0.4)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding(.leading, index == 0 ? 20 : 0)
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Text("의뢰 거절하기")
                                    .font(.pretendard(size: 13))
                                    .foregroundStyle(.gray)
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 10))
                                    .foregroundStyle(.gray)
                                    .padding(.trailing, 20)
                            }
                        }
                    }
                }
                .padding(.top, 1)
                .safeAreaInset(edge: .bottom) {
                    VStack(spacing: 0) {
                        Divider()
                        
                        Spacer()
                        
                        HStack(spacing: 15) {
                            Button {
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(.white)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.JJTitle, lineWidth: 1)
                                    }
                                    .overlay {
                                        Text("문의하기")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(Color.JJTitle)
                                    }
                                    .padding(.leading, 20)
                            }
                            
                            Button {
                                viewModel.isEntireProgressViewVisible = true
                                viewModel.cancelOrder()
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        Text("취소하기")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.trailing, 20)
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(height: 70)
                    .background(Color.mainBackground)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.mainBackground)
            .modifier(NavigationBarBackAndHomeModifier(isEntireProgressVisible: $viewModel.isEntireProgressViewVisible))
            .alert("알림", isPresented: $viewModel.isEntireAlertVisible) {
                Button {
                    if viewModel.isCancelOrderCompleted {
                        navRouter.back()
                    } else {
                        viewModel.entireAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
                    }
                } label: {
                    Text("확인")
                }
            } message: {
                if viewModel.isCancelOrderCompleted {
                    Text("주문이 취소되었습니다.")
                } else {
                    Text(viewModel.entireAlertMessage)
                }
            }
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
        }
    }
}

#Preview {
    NavigationStack {
        ClientRquestedOrderView(orderId: nil)
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
