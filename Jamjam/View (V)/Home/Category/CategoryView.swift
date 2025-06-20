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
    
    @State private var lastOffset: CGFloat = 0
    @State private var downAccum: CGFloat = 0
    @State private var upAccum: CGFloat = 0
    @State private var phase: ScrollPhase = .idle
    
    @State private var isSearchBarVisible = true
    @State private var isTabBarVisible = true
    
    var body: some View {
        MainBackground {
            VStack {
                // MARK: Self Toolbar
                VStack {
                    ZStack {
                        HStack {
                            Button {
                                navRouter.back()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .scaledToFit()
                                    .frame(width: 24, height: isSearchBarVisible ? 24 : 12)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.black)
                                    .padding(.leading, 18)
                            }
                            
                            Spacer()
                            
                            Button {
                                navRouter.navigate(.loginView)
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 80, height: isSearchBarVisible ? 32 : 16)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        Text("로그인")
                                            .font(.system(size: 15))
                                            .foregroundStyle(.white)
                                            .fontWeight(.bold)
                                    }
                                    .padding(.trailing, 18)
                            }
                        }
                        
                        Image("jamjam_main_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: isSearchBarVisible ? 45 : 22)
                    }
                }
                .opacity(isSearchBarVisible ? 1 : 0)
                
                Button {
                    navRouter.navigate(.searchView)
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: isSearchBarVisible ? 42 : 1)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                        }
                        .padding(.horizontal, 35)
                        .foregroundStyle(.white)
                        .overlay {
                            HStack {
                                Text("필요한 손길을 찾아보세요")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.gray)
                                    .padding(.leading)
                                
                                Spacer()
                                
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15)
                                    .foregroundStyle(Color.JJTitle)
                                    .padding(.trailing)
                            }
                            .padding(.horizontal, 35)
                        }
                        .opacity(isSearchBarVisible ? 1 : 0)
                }
                .padding(.bottom, 7)
                
                // MARK: Category
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        Text("경영•기획")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .padding(.leading, 40)
                        
                        Text("컨설팅•멘토링")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        
                        Text("마케팅•홍보")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        
                        Text("개발•IT")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        
                        Text("디자인•편집")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        
                        Text("문서•작문")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        
                        Text("번역•통역")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        
                        Text("사진•영상")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        
                        Text("교육•강의")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        
                        Text("주문 제작")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                    }
                }
                
                Divider()
                
                ScrollView(showsIndicators: false) {
                    GeometryReader { geo in
                        Color.clear
                            .preference(key: ScrollOffsetKey.self,
                                        value: geo.frame(in: .named("SCROLLER")).minY)
                    }
                    .frame(height: 0)
                    
                    Text("Content")
                    
                    VStack {
                        Color.red.opacity(0.1)
                            .frame(width: 10)
                    }
                    .frame(height: 1200)
                }
                .coordinateSpace(name: "SCROLLER")
                .onScrollPhaseChange { _, newPhase in
                    phase = newPhase
                }
                .onPreferenceChange(ScrollOffsetKey.self) { current in
                    if current >= -5 {
                        if !isSearchBarVisible {
                            withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
                                isSearchBarVisible = true
                            }
                        }
                        
                        downAccum = 0
                        upAccum = 0
                        lastOffset = current
                        
                        return
                    }
                    
                    guard phase == .interacting else {
                        lastOffset = current; return
                    }
                    
                    let delta = current - lastOffset
                    
                    // 아래로 스크롤
                    if delta < 0 {
                        downAccum += delta
                        upAccum   = 0
                        
                        if downAccum < -60 {
                            if isSearchBarVisible {
                                withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
                                    isSearchBarVisible = false
                                }
                            }
                            
                            if isTabBarVisible {
                                withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
                                    isTabBarVisible = false
                                }
                            }
                            
                            downAccum = 0
                        }
                        
                    // 위로 스크롤
                    } else if delta > 0 {
                        upAccum += delta
                        downAccum = 0
                        
                        if upAccum > 40 && !isTabBarVisible {
                            withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
                                isTabBarVisible = true
                            }
                            upAccum = 0
                        }
                    }
                    
                    lastOffset = current
                }
                .safeAreaInset(edge: .bottom) {
                    MainTabBar(isCategoryView: true)
                        .offset(y: isTabBarVisible ? 97 : 200)
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


