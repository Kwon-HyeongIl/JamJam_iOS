//
//  ProviderProfileView.swift
//  Jamjam
//
//  Created by 권형일 on 6/30/25.
//

import SwiftUI

struct ProviderProfileView: View {
    @State private var viewModel = ProviderProfileViewModel()
    @Namespace private var tabListUnderline
    
    var body: some View {
        MainBackground {
            ScrollView(showsIndicators: false) {
                VStack {
                    // MARK: Profile Part 1
                    HStack(spacing: 10) {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 60))
                            .foregroundStyle(.gray)
                            .padding(.leading, 20)
                        
                        VStack(spacing: 8) {
                            HStack(spacing: 15) {
                                Text("홍길동")
                                    .font(.pretendard(Pretendard.bold, size: 20))
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.red.opacity(0.1))
                                    .frame(width: 90, height: 25)
                                    .overlay {
                                        Text("컨설팅•멘토링")
                                            .font(.pretendard(Pretendard.medium, size: 12))
                                            .foregroundStyle(Color.JJTitle)
                                    }
                                
                                Spacer()
                            }
                            
                            HStack {
                                Image(systemName: "map")
                                    .font(.pretendard(Pretendard.medium, size: 12))
                                    .foregroundStyle(.gray)
                                
                                Text("부산광역시 남구")
                                    .font(.pretendard(Pretendard.medium, size: 12))
                                    .foregroundStyle(.gray)
                                
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    // MARK: Profile Part 2
                    HStack {
                        Spacer()
                        
                        VStack(spacing: 10) {
                            Text("총 의뢰수")
                                .font(.pretendard(Pretendard.medium, size: 15))
                                .foregroundStyle(.gray)
                            
                            Text("0회")
                                .font(.pretendard(Pretendard.bold, size: 18))
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 10) {
                            Text("만족도")
                                .font(.pretendard(Pretendard.medium, size: 15))
                                .foregroundStyle(.gray)
                            
                            Text("0%")
                                .font(.pretendard(Pretendard.bold, size: 18))
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 10) {
                            Text("경력")
                                .font(.pretendard(Pretendard.medium, size: 15))
                                .foregroundStyle(.gray)
                            
                            Text("28년")
                                .font(.pretendard(Pretendard.bold, size: 18))
                        }
                        
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    // MARK: Contack Part
                    VStack {
                        Button {
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundStyle(Color.JJTitle)
                                .padding(.horizontal, 20)
                                .overlay {
                                    Text("문의하기")
                                        .font(.pretendard(Pretendard.semiBold, size: 15))
                                        .foregroundStyle(.white)
                                }
                        }
                    }
                    .padding(.bottom)
                    
                    // MARK: Tab Selection
                    HStack {
                        ForEach(Array(viewModel.tabList.enumerated()), id: \.offset) { idx, title in
                            VStack(spacing: 4) {
                                Text(title)
                                    .font(.system(size: 16))
                                    .fontWeight(idx == viewModel.selectedIndex ? .semibold : .medium)
                                    .foregroundStyle(idx == viewModel.selectedIndex
                                                     ? .black
                                                     : .gray)
                                    .animation(nil, value: viewModel.selectedIndex)
                                
                                if idx == viewModel.selectedIndex {
                                    Rectangle()
                                        .fill(idx == viewModel.selectedIndex ? Color.JJTitle : .clear)
                                        .frame(height: 2)
                                        .padding(.horizontal, 25)
                                        .matchedGeometryEffect(id: "underline", in: tabListUnderline)
                                    
                                } else {
                                    Color.clear.frame(height: 2)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
                                    viewModel.selectedIndex = idx
                                }
                            }
                        }
                    }
                }
            }
            .modifier(NavigationBarBackAndTitleAndHomeModifier(title: "전문가"))
        }
    }
}

#Preview {
    ProviderProfileView()
        .environment(NavigationRouter())
        .environment(MainTabBarCapsule())
}
