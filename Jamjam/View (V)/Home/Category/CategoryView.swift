//
//  CategoryView.swift
//  Jamjam
//
//  Created by 권형일 on 6/20/25.
//

import SwiftUI

struct CategoryView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = CategoryViewModel()
    
    @Namespace private var categoryUnderline
    
    var body: some View {
        MainBackground {
            VStack(spacing: 0) {
                // MARK: Self Toolbar
                VStack(spacing: 0) {
                    ZStack {
                        HStack {
                            Button {
                                navRouter.back()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .scaledToFit()
                                    .frame(width: 24, height: viewModel.isSearchBarVisible ? 24 : 12)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.black)
                                    .padding(.leading, 18)
                            }
                            
                            Spacer()
                            
                            Button {
                                navRouter.navigate(.loginView)
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 80, height: viewModel.isSearchBarVisible ? 32 : 16)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        Text("로그인")
                                            .font(.pretendard(Pretendard.bold, size: 15))
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.trailing, 18)
                            }
                        }
                        
                        Image("jamjam_main_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: viewModel.isSearchBarVisible ? 45 : 22)
                    }
                }
                .frame(height: viewModel.isSearchBarVisible ? 45 : 0)
                .opacity(viewModel.isSearchBarVisible ? 1 : 0)
                .padding(.bottom, viewModel.isSearchBarVisible ? 12 : 0)
                
                Button {
                    navRouter.navigate(.searchView)
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: viewModel.isSearchBarVisible ? 42 : 1)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                        }
                        .padding(.horizontal, 35)
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
                            .padding(.horizontal, 35)
                        }
                        .opacity(viewModel.isSearchBarVisible ? 1 : 0)
                }
                .frame(height: viewModel.isSearchBarVisible ? 44 : 0)
                .padding(.bottom, viewModel.isSearchBarVisible ? 12 : 0)
                
                // MARK: Category
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(Array(viewModel.categories.enumerated()), id: \.offset) { idx, title in
                            VStack(spacing: 4) {
                                Text(title)
                                    .font(.system(size: 16))
                                    .fontWeight(idx == viewModel.selectedIndex ? .bold : .medium)
                                    .foregroundStyle(idx == viewModel.selectedIndex
                                                     ? Color.JJTitle
                                                     : .primary)
                                    .padding(.leading,
                                             idx == 0 ? 40 : 0)
                                    .animation(nil, value: viewModel.selectedIndex)
                                
                                if idx == viewModel.selectedIndex {
                                    Rectangle()
                                        .fill(idx == viewModel.selectedIndex ? Color.JJTitle : .clear)
                                        .frame(height: 2)
                                        .padding(.leading, idx == 0 ? 40 : 0)
                                        .padding(.horizontal, -3)
                                        .matchedGeometryEffect(id: "underline", in: categoryUnderline)
                                    
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
                .padding(.top, viewModel.isSearchBarVisible ? 7 : 0)
                
                Divider()
                
                ScrollView(showsIndicators: false) {
                    GeometryReader { geo in
                        Color.clear
                            .preference(key: ScrollOffsetKey.self,
                                        value: geo.frame(in: .named("SCROLLER")).minY)
                    }
                    .frame(height: 0)
                    
//                    Text("Content")
//                    
//                    VStack {
//                        Color.red.opacity(0.1)
//                    }
//                    .frame(width: 50, height: 1200)
                    
                    // 내부 뷰
                }
                .coordinateSpace(name: "SCROLLER")
                .onScrollPhaseChange { _, newPhase in
                    viewModel.phase = newPhase
                }
                .onPreferenceChange(ScrollOffsetKey.self) { current in
                    if current >= -5 {
                        if !viewModel.isSearchBarVisible {
                            withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
                                viewModel.isSearchBarVisible = true
                            }
                        }
                        
                        viewModel.downAccum = 0
                        viewModel.upAccum = 0
                        viewModel.lastOffset = current
                        
                        return
                    }
                    
                    guard viewModel.phase == .interacting else {
                        viewModel.lastOffset = current; return
                    }
                    
                    let delta = current - viewModel.lastOffset
                    
                    // 아래로 스크롤
                    if delta < 0 {
                        viewModel.downAccum += delta
                        viewModel.upAccum   = 0
                        
                        if viewModel.downAccum < -60 {
                            if viewModel.isSearchBarVisible {
                                withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
                                    viewModel.isSearchBarVisible = false
                                }
                            }
                            
                            if viewModel.isTabBarVisible {
                                withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
                                    viewModel.isTabBarVisible = false
                                }
                            }
                            
                            viewModel.downAccum = 0
                        }
                        
                    // 위로 스크롤
                    } else if delta > 0 {
                        viewModel.upAccum += delta
                        viewModel.downAccum = 0
                        
                        if viewModel.upAccum > 40 && !viewModel.isTabBarVisible {
                            withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
                                viewModel.isTabBarVisible = true
                            }
                            viewModel.upAccum = 0
                        }
                    }
                    
                    viewModel.lastOffset = current
                }
                .safeAreaInset(edge: .bottom) {
                    MainTabBar(isCategoryView: true)
                        .offset(y: viewModel.isTabBarVisible ? 97 : 200)
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    CategoryView()
        .environment(NavigationRouter())
        .environment(MainTabBarCapsule())
}


