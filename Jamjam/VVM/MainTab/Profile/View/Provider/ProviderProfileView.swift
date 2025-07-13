//
//  ProviderProfileView.swift
//  Jamjam
//
//  Created by 권형일 on 6/30/25.
//

import SwiftUI

struct ProviderProfileView: View {
    @Environment(NavigationCore.self) var navRouter
    @Environment(MainTabBarCapsule.self) var mainTabBarCapsule
    @State private var viewModel: ProviderProfileViewModel
    
    @State private var position = ScrollPosition()
    @State private var isTabBarVisible = true
    
    @Namespace private var tabListUnderline
    
    init(userId: Int) {
        viewModel = ProviderProfileViewModel(userId: userId)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack {
                        // MARK: Profile Part
                        HStack(spacing: 15) {
                            if let url = viewModel.provider?.profileUrl {
                                AsyncImage(url: URL(string: url)) { state in
                                    switch state {
                                    case .empty:
                                        Circle()
                                            .foregroundStyle(.gray.opacity(0.5))
                                            .shimmering()
                                        
                                    case .success(let image):
                                        image
                                            .resizable()
                                        
                                    case .failure:
                                        Circle()
                                            .foregroundStyle(.gray.opacity(0.5))
                                        
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .scaledToFit()
                                .frame(width: 50)
                                .clipShape(Circle())
                                .padding(.leading, 20)
                                
                            } else {
                                Circle()
                                    .foregroundStyle(.gray.opacity(0.5))
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .padding(.leading)
                            }
                            
                            VStack(spacing: 8) {
                                HStack(spacing: 15) {
                                    Text(viewModel.provider?.nickname ?? "")
                                        .font(.pretendard(Pretendard.semiBold, size: 20))
                                    
                                    HStack {
                                        Text(viewModel.provider?.category?.text ?? "")
                                            .font(.pretendard(Pretendard.medium, size: 10))
                                            .foregroundStyle(Color.JJTitle)
                                    }
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(.red.opacity(0.1))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Image("location_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 10)
                                    
                                    Text(viewModel.provider?.location ?? "")
                                        .font(.pretendard(Pretendard.medium, size: 12))
                                        .foregroundStyle(.gray)
                                    
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.bottom)
                        
                        VStack(spacing: 5) {
                            HStack(spacing: 15) {
                                Text("연락 가능 시간 :")
                                    .font(.pretendard(size: 13))
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 20)
                                
                                Text("\(String(viewModel.provider?.contactHours.startHour ?? 0))시~\(String(viewModel.provider?.contactHours.endHour ?? 0))시")
                                    .font(.pretendard(Pretendard.medium, size: 13))
                                    .foregroundStyle(.gray)
                                
                                Spacer()
                            }
                            
                            HStack(spacing: 15) {
                                Text("평균 답변 시간 :")
                                    .font(.pretendard(size: 13))
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 20)
                                
                                Text("\(viewModel.provider?.averageResponseTime ?? "0")")
                                    .font(.pretendard(Pretendard.medium, size: 13))
                                    .foregroundStyle(.gray)
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, 5)
                        
                        // MARK: Tab Selection
                        LazyVStack(pinnedViews: [.sectionHeaders]) {
                            Section {
                                VStack(spacing: 50) {
                                    // MARK: 자기 소개
                                    VStack(spacing: 20) {
                                        HStack {
                                            Text("자기 소개")
                                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                        .padding(.top, 10)
                                        
                                        HStack {
                                            Text(viewModel.provider?.introduction ?? "")
                                                .font(.pretendard(Pretendard.medium, size: 13))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                    }
                                    
                                    // MARK: 보유 기술
                                    VStack(spacing: 20) {
                                        HStack {
                                            Text("보유 기술")
                                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                        
                                        ScrollView(.horizontal) {
                                            HStack(spacing: 5) {
                                                ForEach(Array((viewModel.provider?.detailSkills ?? []).enumerated()), id: \.offset) { index, detailSkill in
                                                    HStack {
                                                        Text(detailSkill)
                                                            .font(.pretendard(size: 15))
                                                    }
                                                    .padding(.horizontal, 8)
                                                    .padding(.vertical, 4)
                                                    .background(.white)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                                    }
                                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                                    .padding(.leading, index == 0 ? 20 : 0)
                                                    
                                                }
                                            }
                                        }
                                    }
                                    
                                    // MARK: 경력 사항
                                    VStack(spacing: 20) {
                                        HStack {
                                            Text("경력 사항")
                                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                        
                                        VStack {
                                            ForEach(viewModel.provider?.careers ?? [], id: \.id) { career in
                                                HStack {
                                                    Image(systemName: "bag.fill")
                                                        .font(.system(size: 12))
                                                        .foregroundStyle(.gray.opacity(0.2))
                                                        .padding(.leading, 20)
                                                    
                                                    Text(career.company)
                                                        .font(.pretendard(size: 13))
                                                        .padding(.trailing, 2)
                                                    
                                                    Text(career.position)
                                                        .font(.pretendard(size: 13))
                                                    
                                                    Spacer()
                                                }
                                            }
                                        }
                                    }
                                    
                                    // MARK: 학력
                                    VStack(spacing: 20) {
                                        HStack {
                                            Text("학력")
                                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                        
                                        VStack {
                                            ForEach(viewModel.provider?.educations ?? [], id: \.id) { education in
                                                HStack {
                                                    Image(systemName: "graduationcap.fill")
                                                        .font(.system(size: 12))
                                                        .foregroundStyle(.gray.opacity(0.2))
                                                        .padding(.leading, 20)
                                                    
                                                    Text(education.school)
                                                        .font(.pretendard(size: 13))
                                                        .padding(.trailing, 2)
                                                    
                                                    Text(education.major)
                                                        .font(.pretendard(size: 13))
                                                        .padding(.trailing, 2)
                                                    
                                                    Text(education.degree)
                                                        .font(.pretendard(size: 13))
                                                    
                                                    Spacer()
                                                }
                                            }
                                        }
                                    }
                                    
                                    // MARK: 자격증
                                    VStack(spacing: 20) {
                                        HStack {
                                            Text("자격증")
                                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                        
                                        VStack {
                                            ForEach(viewModel.provider?.licenses ?? [], id: \.id) { license in
                                                HStack {
                                                    Image(systemName: "person.crop.square.filled.and.at.rectangle.fill")
                                                        .font(.system(size: 12))
                                                        .foregroundStyle(.gray.opacity(0.2))
                                                        .padding(.leading, 20)
                                                    
                                                    Text(license.name)
                                                        .font(.pretendard(size: 13))
                                                    
                                                    Spacer()
                                                }
                                            }
                                        }
                                    }
                                    
                                    // MARK: 제공 서비스
                                    VStack(spacing: 15) {
                                        HStack {
                                            Text("제공 서비스")
                                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                        
                                        ScrollView(.horizontal) {
                                            HStack(spacing: 10) {
                                                ForEach(Array((viewModel.provider?.services ?? []).enumerated()), id: \.element.serviceId) { index, service in
                                                    AsyncImage(url: URL(string: service.thumbnailUrl)) { state in
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
                                            withAnimation(.customAnimation) {
                                                viewModel.selectedIndex = idx
                                            }
                                        }
                                        .onChange(of: viewModel.selectedIndex) { _, newIndex in
                                            if newIndex == 0 {
                                                withAnimation(.customAnimation) {
                                                    position.scrollTo(edge: .top)
                                                }
                                                
                                            } else if newIndex == 1 {
                                                withAnimation(.customAnimation) {
                                                    position.scrollTo(edge: .bottom)
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.top, 10)
                                .background(Color.mainBackground)
                            }
                        }
                    }
                }
                .padding(.top, 1)
                .scrollPosition($position)
                .onScrollGeometryChange(for: CGFloat.self) { geometry in
                    geometry.contentOffset.y
                } action: { oldY, newY in
                    if newY <= 0 {
                        withAnimation(.customAnimation) {
                            isTabBarVisible = true
                        }
                        
                        return
                    }
                    
                    let delta = newY - oldY
                    
                    guard abs(delta) > 5 else { return }
                    
                    withAnimation(.customAnimation) {
                        isTabBarVisible = delta < 0
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    VStack(spacing: 0) {
                        Divider()
                        
                        Spacer()
                        
                        Button {
                            viewModel.startChat()
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
            .onChange(of: viewModel.isNavigateToChatRoom) { _, isNavigateToChatRoom in
                if isNavigateToChatRoom {
                    mainTabBarCapsule.selectedTab = .chat
                    navRouter.navigate(.chatContentView(viewModel.targetRoomId, viewModel.provider?.nickname, viewModel.provider?.profileUrl))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProviderProfileView(userId: 0)
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}

