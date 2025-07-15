//
//  ProviderCacelledOrderView.swift
//  Jamjam
//
//  Created by 권형일 on 7/16/25.
//

import SwiftUI

struct ProviderCacelledOrderView: View {
    @Environment(NavigationCore.self) var navRouter
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 40) {
                    VStack(spacing: 13) {
                        HStack {
                            Text("취소 사유")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .foregroundStyle(Color.JJTitle)
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("다른 목도리를 구매했어요.")
                                .font(.pretendard(Pretendard.bold, size: 20))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                    }
                    .padding(.top, 10)
                    
                    VStack(spacing: 13) {
                        HStack {
                            Text("의뢰 제목")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .foregroundStyle(.gray)
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("강아지 목도리 뜨개질 해주세요.")
                                .font(.pretendard(Pretendard.bold, size: 22))
                                .padding(.horizontal, 20)
                            
                            Spacer()
                        }
                    }
                    
                    VStack(spacing: 13) {
                        HStack {
                            Text("희망 마감일")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .foregroundStyle(.gray)
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        HStack(spacing: 15) {
                            Text("2025년 10월 1일")
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
                            Text("호두가 목도리 하고 다니면 귀여울 것 같아요.\n호두 겨울 싫어하거든요 호두는 추위를 많이 타요.")
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
                        
//                        ScrollView(.horizontal) {
//                            HStack(spacing: 10) {
//                                ForEach(Array((viewModel.service?.portfolioImages ?? []).enumerated()), id: \.element.imageId) { index, image in
//                                    AsyncImage(url: URL(string: image.url)) { state in
//                                        switch state {
//                                        case .empty:
//                                            RoundedRectangle(cornerRadius: 10)
//                                                .foregroundStyle(.gray.opacity(0.1))
//                                                .shimmering()
//
//                                        case .success(let image):
//                                            image
//                                                .resizable()
//
//                                        case .failure:
//                                            RoundedRectangle(cornerRadius: 10)
//                                                .foregroundStyle(.gray.opacity(0.1))
//
//                                        @unknown default:
//                                            EmptyView()
//                                        }
//                                    }
//                                    .frame(width: proxy.size.width * 0.4, height: proxy.size.width * 0.4)
//                                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                                    .padding(.leading, index == 0 ? 20 : 0)
//                                }
//                            }
//                        }
                    }
                    .padding(.bottom, 10)
                }
            }
            .padding(.top, 1)
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0) {
                    Divider()
                    
                    Spacer()
                    
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
                            .padding(.horizontal, 20)
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

#Preview {
    NavigationStack {
        ProviderCacelledOrderView()
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
