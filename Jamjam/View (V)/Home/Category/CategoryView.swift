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
    @State private var isScrollUp = true
    @State private var isSCrollDown = false
    @State private var isSearchBarVisible = true
        
    
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
                                    .opacity(isSearchBarVisible ? 1 : 0)
                                
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
                    .frame(height: 900)
                }
                .coordinateSpace(name: "SCROLLER")
                .onPreferenceChange(ScrollOffsetKey.self) { current in
                    if current < lastOffset {
                        if isScrollUp {
                            withAnimation {
                                isSearchBarVisible = false
                            }
                            isScrollUp = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                isSCrollDown = true
                            }
                        }
                        
                    } else if current > lastOffset {
                        if isSCrollDown {
                            withAnimation {
                                isSearchBarVisible = true
                            }
                            isSCrollDown = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                isScrollUp = true
                            }
                        }
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

private struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
