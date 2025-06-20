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
    @State private var accumulated: CGFloat = 0
    @State private var phase: ScrollPhase = .idle
    @State private var isSearchBarVisible = true
    
    private let threshold: CGFloat = 60
        
    
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
                    guard phase == .interacting else { return }
                    
                    let delta = current - lastOffset
                    
                    if delta.sign == accumulated.sign {
                        accumulated += delta
                    } else {
                        accumulated = delta
                    }
                    
                    if accumulated < -threshold && isSearchBarVisible {
                        withAnimation {
                            isSearchBarVisible = false
                        }
                        accumulated = 0
                    }
                    if accumulated >  threshold && !isSearchBarVisible {
                        withAnimation {
                            isSearchBarVisible = true
                        }
                        accumulated = 0
                    }
                    
                    lastOffset = current
                }
                .safeAreaInset(edge: .bottom) {
                    MainTabBar(isCategoryView: true)
                        .offset(y: 97)
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


