//
//  HomeView.swift
//  Jamjam
//
//  Created by 권형일 on 6/12/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @State private var carouselCurrentIndex: Int? = 0
    
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
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // MARK: Main Text
                    HStack {
                        Text("경험이 있는 손,\n지금 필요한 일에 연결해보세요")
                            .font(.system(size: 23))
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding(.top)
                            .padding(.leading, 35)
                        
                        Spacer()
                    }
                    .padding(.bottom, 17)
                    
                    // MARK: Search Bar
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
                                        .frame(height: 15)
                                        .foregroundStyle(.gray)
                                        .padding(.trailing)
                                }
                                .padding(.horizontal, 35)
                            }
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                    }
                    
                    // MARK: Carousel
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        ZStack {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0) {
                                    ForEach(viewModel.carouselCards.indices, id: \.self) { index in
                                        let card = viewModel.carouselCards[index]
                                        
                                        GeometryReader { innerProxy in
                                            let cardSize = innerProxy.size
                                            
                                            let scrollCenterX = proxy.size.width / 2
                                            let cardCenterX = innerProxy.frame(in: .scrollView).midX
                                            let distance = cardCenterX - scrollCenterX
                                            let parallax = distance * 0.7
                                            
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
                                                .id(index)
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
                                .frame(height: size.height)
                            }
                            .scrollTargetBehavior(.viewAligned)
                            .scrollPosition(id: $carouselCurrentIndex, anchor: .center)
                            
                            VStack {
                                Spacer()
                                
                                HStack {
                                    ForEach(0..<viewModel.carouselCards.count, id: \.self) { index in
                                        Circle()
                                            .scaledToFit()
                                            .frame(height: 5)
                                            .foregroundStyle(index == carouselCurrentIndex ? .white : .gray)
                                            .scaleEffect(index == carouselCurrentIndex ? 1.25 : 1)
                                            .animation(.default, value: carouselCurrentIndex)
                                            .padding(.bottom, 60)
                                    }
                                }
                            }
                        }
                    }
                    .frame(height: 300)
                    .padding(.horizontal, -15)

                    // MARK: Category
                    VStack(spacing: 10) {
                        HStack(spacing: 10) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .frame(height: 60)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                }
                                .overlay {
                                    Text("category")
                                        .font(.system(size: 12))
                                }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .frame(height: 60)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                }
                                .overlay {
                                    Text("category")
                                        .font(.system(size: 12))
                                }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .frame(height: 60)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                }
                                .overlay {
                                    Text("category")
                                        .font(.system(size: 12))
                                }
                        }
                        .padding(.horizontal, 35)
                        
                        HStack(spacing: 10) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .frame(height: 60)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                }
                                .overlay {
                                    Text("category")
                                        .font(.system(size: 12))
                                }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .frame(height: 60)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                }
                                .overlay {
                                    Text("category")
                                        .font(.system(size: 12))
                                }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .frame(height: 60)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                }
                                .overlay {
                                    Text("category")
                                        .font(.system(size: 12))
                                }
                        }
                        .padding(.horizontal, 35)
                        
                        HStack(spacing: 10) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .frame(height: 60)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                }
                                .overlay {
                                    Text("category")
                                        .font(.system(size: 12))
                                }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .frame(height: 60)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                }
                                .overlay {
                                    Text("category")
                                        .font(.system(size: 12))
                                }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .frame(height: 60)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                }
                                .overlay {
                                    Text("category")
                                        .font(.system(size: 12))
                                }
                        }
                        .padding(.horizontal, 35)
                        
                        VStack(spacing: 5) {
                            Text("더보기")
                                .font(.system(size: 12))
                                
                            Image(systemName: "chevron.down")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10)
                        }
                        .foregroundStyle(.gray)
                        .padding(.top)
                    }
                }
            }
        }
        .background(.gray.opacity(0.15))
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    HomeView()
}
