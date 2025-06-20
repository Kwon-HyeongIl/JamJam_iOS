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
    
    var body: some View {
        MainBackground {
            VStack {
                Button {
                    navRouter.navigate(.searchView)
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 42)
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
