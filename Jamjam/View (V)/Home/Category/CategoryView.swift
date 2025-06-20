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
                Button {
                    navRouter.navigate(.searchView)
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: isSearchBarVisible ? 42 : 0)
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
                            .opacity(isSearchBarVisible ? 1 : 0)
                            .padding(.horizontal, 35)
                        }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Text("ABCD")
                            .padding(.leading, 40)
                        
                        Text("ABCD")
                        
                        Text("ABCD")
                        
                        Text("ABCD")
                        
                        Text("ABCD")
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
                            withAnimation {
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
                                withAnimation {
                                    isSearchBarVisible = false
                                }
                            }
                            
                            if isTabBarVisible {
                                withAnimation {
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
                            withAnimation { isTabBarVisible = true }
                            upAccum = 0
                        }
                    }
                    
                    lastOffset = current
                }
                .safeAreaInset(edge: .bottom) {
                    MainTabBar(isCategoryView: true)
                        .offset(y: isTabBarVisible ? 97 : 200)
                        .animation(.easeInOut, value: isTabBarVisible)
                }
            }
            .modifier(NavigationBarBackAndTitleLogoModifier())
        }
    }
}

#Preview {
    CategoryView()
        .environment(NavigationRouter())
        .environment(MainTabBarCapsule())
}


