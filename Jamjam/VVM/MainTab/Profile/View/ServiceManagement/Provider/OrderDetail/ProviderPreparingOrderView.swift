//
//  ProviderPreparingOrderView.swift
//  Jamjam
//
//  Created by 권형일 on 7/16/25.
//

import SwiftUI

struct ProviderPreparingOrderView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel: ProviderPreparingOrderViewModel
    
    init(orderId: Int?) {
        viewModel = ProviderPreparingOrderViewModel(orderId: orderId)
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
                                Text("마감일")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            HStack(spacing: 15) {
                                Text(viewModel.order?.deadLineDday ?? "")
                                    .font(.pretendard(Pretendard.bold, size: 20))
                                    .foregroundStyle(Color.JJTitle)
                                    .padding(.leading, 20)
                                
                                Text(viewModel.order?.deadLine ?? "")
                                    .font(.pretendard(Pretendard.bold, size: 20))
                                
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
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        Text("완료하기")
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
            .modifier(NavigationBarBackAndHomeModifier())
        }
    }
}

#Preview {
    NavigationStack {
        ProviderPreparingOrderView(orderId: nil)
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
