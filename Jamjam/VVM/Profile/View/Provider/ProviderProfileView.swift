//
//  ProviderProfileView.swift
//  Jamjam
//
//  Created by 권형일 on 6/30/25.
//

import SwiftUI

struct ProviderProfileView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = ProviderProfileViewModel()
    
    @State private var position = ScrollPosition()
    @State private var isTabBarVisible = true
    
    @Namespace private var tabListUnderline
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack {
                    // MARK: Profile Part
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
                    
                    // MARK: Tab Selection
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        Section {
                            VStack {
                                // MARK: 자기 소개
                                VStack {
                                    HStack {
                                        Text("자기 소개")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .padding(.leading, 30)
                                        
                                        Spacer()
                                    }
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                    
                                    HStack {
                                        Text("안녕하세요! 저는 다양한 분야에서 경험을 쌓아온 전문가입니다. 고객의 니즈에 맞는 맞춤형 서비스를 제공하며, 항상 최고의 결과를 위해 노력하고 있습니다.")
                                            .font(.pretendard(Pretendard.medium, size: 13))
                                            .padding(.leading, 30)
                                        
                                        Spacer()
                                    }
                                }
                                .padding(.bottom)
                                
                                // MARK: 보유 기술
                                VStack {
                                    HStack {
                                        Text("보유 기술")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .padding(.leading, 30)
                                        
                                        Spacer()
                                    }
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                    
                                    HStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 70, height: 30)
                                            .foregroundStyle(.white)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.gray.opacity(0.3), lineWidth: 1)
                                            }
                                            .padding(.leading, 30)
                                        
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 70, height: 30)
                                            .foregroundStyle(.white)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.gray.opacity(0.3), lineWidth: 1)
                                            }
                                        
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 70, height: 30)
                                            .foregroundStyle(.white)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.gray.opacity(0.3), lineWidth: 1)
                                            }
                                        
                                        Spacer()
                                    }
                                }
                                .padding(.bottom)
                                
                                // MARK: 경력 사항
                                VStack {
                                    HStack {
                                        Text("경력 사항")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .padding(.leading, 30)
                                        
                                        Spacer()
                                    }
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                    
                                    HStack {
                                        Image(systemName: "graduationcap.fill")
                                            .font(.system(size: 12))
                                            .foregroundStyle(.gray.opacity(0.2))
                                            .padding(.leading, 30)
                                        
                                        Text("서울대학교 컴퓨터공학과 졸업")
                                            .font(.pretendard(Pretendard.medium, size: 13))
                                        
                                        Spacer()
                                    }
                                }
                                .padding(.bottom)
                                
                                Rectangle()
                                    .frame(width: 50, height: 800)
                                    .foregroundStyle(.red.opacity(0.1))
                                
                                // MARK: 제공 서비스
                                VStack {
                                    HStack {
                                        Text("제공 서비스")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .padding(.leading, 30)
                                        
                                        Spacer()
                                    }
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                }
                                
                                Rectangle()
                                    .frame(width: 50, height: 500)
                                    .foregroundStyle(.red.opacity(0.1))
                            }
                        } header: {
                            HStack {
                                ForEach(Array(viewModel.tabBarList.enumerated()), id: \.offset) { idx, title in
                                    VStack(spacing: 8) {
                                        Text(title)
                                            .font(.system(size: 16))
                                            .fontWeight(idx == viewModel.selectedIndex ? .semibold : .medium)
                                            .foregroundStyle(idx == viewModel.selectedIndex ? .black : .gray)
                                            .animation(nil, value: viewModel.selectedIndex)
                                        
                                        if idx == viewModel.selectedIndex {
                                            Rectangle()
                                                .fill(Color.JJTitle)
                                                .frame(height: 2)
                                                .padding(.horizontal, 25)
                                                .matchedGeometryEffect(id: "underline", in: tabListUnderline)
                                        } else {
                                            Color.clear.frame(height: 2)
                                        }
                                    }
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.1,
                                                              dampingFraction: 1,
                                                              blendDuration: 0)) {
                                            viewModel.selectedIndex = idx
                                        }
                                    }
                                    .onChange(of: viewModel.selectedIndex) { _, newIndex in
                                        if newIndex == 0 {
                                            withAnimation(.spring(response: 0.1,
                                                                  dampingFraction: 1,
                                                                  blendDuration: 0)) {
                                                position.scrollTo(edge: .top)
                                            }
                                            
                                        } else if newIndex == 1 {
                                            withAnimation(.spring(response: 0.1,
                                                                  dampingFraction: 1,
                                                                  blendDuration: 0)) {
                                                position.scrollTo(edge: .bottom)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.top)
                            .background(Color.mainBackground)
                        }
                    }
                }
            }
            .scrollPosition($position)
            .onScrollGeometryChange(for: CGFloat.self) { geometry in
                geometry.contentOffset.y
            } action: { oldY, newY in
                if newY <= 0 {
                    withAnimation(.spring(response: 0.1, dampingFraction: 1.0, blendDuration: 0)) {
                        isTabBarVisible = true
                    }
                    
                    return
                }
                
                let delta = newY - oldY
                
                guard abs(delta) > 5 else { return }
                
                withAnimation(.spring(response: 0.1, dampingFraction: 1.0, blendDuration: 0)) {
                    isTabBarVisible = delta < 0
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0) {
                    Divider()
                    
                    Spacer()
                    
                    Button {
                        viewModel.startChatRoom()
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
                    
                    Spacer()
                }
                .frame(height: 70)
                .background(Color.mainBackground)
                .offset(y: isTabBarVisible ? 0 : 110)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleAndHomeModifier(title: "전문가"))
        .alert("채팅 연결 실패", isPresented: $viewModel.isChatAlertVisible) {
            Button {
                viewModel.chatAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
            } label: {
                Text("확인")
            }
        } message: {
            Text(viewModel.chatAlertMessage)
        }
        .onChange(of: viewModel.isNavigateToChatRoom) { _, newValue in
            if newValue == true {
//                let chatRoom = ChatRoom(id: 0, nickname: "", lastMessage: "", lastMessageTime: "", unreadCount: 0, profileUrl: "")
//                navRouter.navigate(.chatContentView(chatRoom))
                viewModel.isNavigateToChatRoom = false
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProviderProfileView()
            .environment(NavigationRouter())
            .environment(MainTabBarCapsule())
    }
}

