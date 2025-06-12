//
//  HomeView.swift
//  Jamjam
//
//  Created by 권형일 on 6/12/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("logo")
                        .padding(.leading)
                    
                    Spacer()
                }
            }
            .frame(height: 100)
            .background(.white)
            
            ScrollView {
                VStack {
                    HStack {
                        Text("경험이 있는 손,\n지금 필요한 일에 연결해보세요")
                            .font(.system(size: 23))
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding(.top)
                            .padding(.leading, 35)
                        
                        Spacer()
                    }
                    
                    Button {
                        // navigate searching view
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
                                        .foregroundStyle(.gray)
                                        .padding(.trailing)
                                }
                                .padding(.horizontal, 35)
                            }
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                    }
                    
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 0) {
                                ForEach(viewModel.carouselCards) { card in
                                    GeometryReader { innerProxy in
                                        let cardSize = innerProxy.size
                                        
                                        let scrollCenterX = proxy.size.width / 2
                                        let cardCenterX = innerProxy.frame(in: .scrollView).midX
                                        let distance = cardCenterX - scrollCenterX
                                        let parallax = distance * 0.7 // 0.6 ~ 0.7 사이로 설정
                                        
                                        Image(card.image)
                                            .resizable()
                                            .scaledToFill()
                                            .offset(x: -parallax)
                                            .frame(width: cardSize.width * 1.5)
                                            .frame(width: cardSize.width,
                                                   height: cardSize.height)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                            .shadow(color: .gray.opacity(0.2),
                                                    radius: 5, x: 5, y: 5)
                                    }
                                    .frame(width: size.width - 100,
                                           height: size.height - 50)
                                    .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                        view.scaleEffect(phase.isIdentity ? 1 : 0.9)
                                    }
                                }
                            }
                            .padding(.horizontal, 50)
                            .scrollTargetLayout()
                            .frame(height: size.height, alignment: .top)
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .scrollIndicators(.hidden)
                    }
                    .frame(height: 300)
                    .padding(.horizontal, -15)
                    .padding(.top, 10)

                }
            }
            .scrollIndicators(.hidden)
        }
        .background(.gray.opacity(0.15))
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    HomeView()
}
