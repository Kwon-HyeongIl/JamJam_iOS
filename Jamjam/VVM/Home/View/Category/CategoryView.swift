//
//  CategoryView.swift
//  Jamjam
//
//  Created by 권형일 on 6/20/25.
//

import SwiftUI

struct CategoryView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel: CategoryViewModel
    
    @State private var isTabBarVisible = true
    
    @Namespace private var categoryUnderline
    
    init(skill: Skill) {
        viewModel = CategoryViewModel(skill: skill)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        Button {
                            navRouter.navigate(.searchView)
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 42)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.2), lineWidth: 1)
                                }
                                .padding(.horizontal, 20)
                                .foregroundStyle(.white)
                                .overlay {
                                    HStack {
                                        Text("필요한 손길을 찾아보세요")
                                            .font(.pretendard(size: 14))
                                            .foregroundStyle(.gray)
                                            .padding(.leading)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "magnifyingglass")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16)
                                            .foregroundStyle(Color.JJTitle)
                                            .padding(.trailing)
                                    }
                                    .padding(.horizontal, 20)
                                }
                        }
                        .frame(height: 44)
                        .padding(.top, 10)
                        
                        // MARK: Category Selection
                        LazyVStack(pinnedViews: [.sectionHeaders]) {
                            Section {
                                LazyVGrid(columns: viewModel.columns, spacing: 10) {
                                    ForEach(viewModel.services, id: \.serviceId) { service in
                                        ServiceCellView(service: service, upperWidth: proxy.size.width)
                                            .onTapGesture {
                                                navRouter.navigate(.serviceView(service.serviceId))
                                            }
                                            .onAppear {
                                                if service.serviceId == viewModel.services.last?.serviceId {
                                                    viewModel.fetchServiceWithCategory()
                                                }
                                            }
                                    }
                                    .padding(.horizontal, 20)
                                }
                            } header: {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 14) {
                                        ForEach(Skill.allCases, id: \.self) { skill in
                                            let isSelected = (skill == viewModel.selectedSkill)
                                            
                                            VStack(spacing: 4) {
                                                Text(skill.text)
                                                    .font(.pretendard(size: 16))
                                                    .foregroundStyle(isSelected ? .black : .gray)
                                                    .padding(.leading,
                                                             skill == .management ? 20 : 0)
                                                
                                                if isSelected {
                                                    Rectangle()
                                                        .fill(Color.JJTitle)
                                                        .frame(height: 2)
                                                        .padding(.leading,
                                                                 skill == .management ? 20 : 0)
                                                        .matchedGeometryEffect(id: "underline",
                                                                               in: categoryUnderline)
                                                } else {
                                                    Color.clear.frame(height: 2)
                                                }
                                            }
                                            .onTapGesture {
                                                withAnimation(.customAnimation) {
                                                    viewModel.selectedSkill = skill
                                                    viewModel.restoreServices()
                                                    viewModel.fetchServiceWithCategory()
                                                }
                                            }
                                        }
                                    }
                                    .padding(.top, 12)
                                    .background(Color.mainBackground)
                                }
                            }
                        }
                    }
                }
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
                    MainTabBar(isCategoryView: true)
                        .offset(y: isTabBarVisible ? 97 : 200)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.mainBackground)
            .modifier(NavigationBarBackAndLogoAndLoginButtonModifier())
            .onAppear {
                viewModel.fetchServiceWithCategory()
            }
        }
    }
}

#Preview {
    NavigationStack {
        CategoryView(skill: Skill.management)
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}


