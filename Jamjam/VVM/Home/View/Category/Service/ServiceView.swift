//
//  ServiceContentView.swift
//  Jamjam
//
//  Created by 권형일 on 7/11/25.
//

import SwiftUI

struct ServiceView: View {
    @Environment(NavigationCore.self) var navRouter
    @Environment(MainTabBarCapsule.self) var mainTabBarCapsule
    @State private var viewModel: ServiceViewModel
    
    @State private var position = ScrollPosition()
    
    @Namespace private var tabListUnderline
    
    init(serviceId: Int) {
        viewModel = ServiceViewModel(serviceId: serviceId)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        HStack {
                            Text(Skill(rawValue: viewModel.service?.category ?? 0)?.text ?? "")
                                .font(.pretendard(Pretendard.medium, size: 16))
                                .foregroundStyle(Color.JJTitle)
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        .padding(.top)
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text(viewModel.service?.serviceName ?? "")
                                .font(.pretendard(Pretendard.bold, size: 23))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        .padding(.bottom, 20)
                        
                        HStack(spacing: 20) {
                            if let url = viewModel.service?.profileUrl {
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
                                .padding(.leading)
                                
                            } else {
                                Circle()
                                    .foregroundStyle(.gray.opacity(0.5))
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .padding(.leading)
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(viewModel.service?.nickname ?? "")
                                    .font(.pretendard(Pretendard.medium, size: 18))
                                
                                HStack(spacing: 5) {
                                    Image(systemName: "mappin.and.ellipse")
                                        .font(.system(size: 8))
                                        .foregroundStyle(.gray)
                                    
                                    Text(viewModel.service?.location ?? "")
                                        .font(.pretendard(size: 13))
                                        .foregroundStyle(.gray)
                                }
                            }
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                        
                        HStack {
                            HStack {
                                Text("가격")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 45)
                                
                                Spacer()
                                
                                Text("\(String(viewModel.service?.salary ?? 0)) 원")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .foregroundStyle(.white)
                                
                                Text("(VAT 포함가)")
                                    .font(.pretendard(Pretendard.medium, size: 10))
                                    .foregroundStyle(.white)
                                    .padding(.trailing, 45)
                            }
                        }
                        .frame(maxWidth:. infinity)
                        .frame(height: 45)
                        .background(Color.JJTitle)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                        
                        LazyVStack(pinnedViews: [.sectionHeaders]) {
                            Section {
                                VStack(spacing: 50) {
                                    // MARK: 썸네일 이미지
                                    AsyncImage(url: URL(string: viewModel.service?.thumbnailUrl ?? "")) { state in
                                        switch state {
                                        case .empty:
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.gray.opacity(0.5))
                                                .shimmering()
                                            
                                        case .success(let image):
                                            image
                                                .resizable()
                                            
                                        case .failure:
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.gray.opacity(0.5))
                                            
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.horizontal, 20)
                                    .padding(.top, 10)
                                    
                                    // MARK: 서비스 명
                                    VStack(spacing: 15) {
                                        HStack {
                                            Text("서비스 명")
                                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text(viewModel.service?.serviceName ?? "")
                                                .font(.pretendard(Pretendard.medium, size: 13))
                                                .padding(.horizontal, 20)
                                            
                                            Spacer()
                                        }
                                    }
                                    
                                    // MARK: 서비스 설명
                                    VStack(spacing: 15) {
                                        HStack {
                                            Text("서비스 설명")
                                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text(viewModel.service?.description ?? "")
                                                .font(.pretendard(Pretendard.medium, size: 13))
                                                .padding(.horizontal, 20)
                                            
                                            Spacer()
                                        }
                                    }
                                    
                                    // MARK: 포트폴리오
                                    VStack(spacing: 15) {
                                        HStack {
                                            Text("포트폴리오")
                                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                        
                                        ScrollView(.horizontal) {
                                            HStack(spacing: 10) {
                                                ForEach(Array((viewModel.service?.portfolioImages ?? []).enumerated()), id: \.element.imageId) { index, image in
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
                .scrollPosition($position)
                .onScrollGeometryChange(for: CGFloat.self) { geometry in
                    geometry.contentOffset.y
                } action: { oldY, newY in
                    if newY <= 0 {
                        withAnimation(.customAnimation) {
                            viewModel.isTabBarVisible = true
                        }
                        
                        return
                    }
                    
                    let delta = newY - oldY
                    
                    guard abs(delta) > 5 else { return }
                    
                    withAnimation(.customAnimation) {
                        viewModel.isTabBarVisible = delta < 0
                    }
                }
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
                                        Text("결제하기")
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
                    .offset(y: viewModel.isTabBarVisible ? 0 : 110)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.mainBackground)
            .modifier(NavigationBarBackAndHomeModifier())
            .onChange(of: viewModel.isNavigateToChatRoom) { _, isNavigateToChatRoom in
                if isNavigateToChatRoom {
                    mainTabBarCapsule.selectedTab = .chat
                    navRouter.navigate(.chatContentView(viewModel.targetRoomId, viewModel.service?.nickname, viewModel.service?.profileUrl))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ServiceView(serviceId: 0)
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
