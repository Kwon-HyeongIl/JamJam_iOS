//
//  HomeView.swift
//  Jamjam
//
//  Created by 권형일 on 6/12/25.
//

import SwiftUI
import Combine
import ShuffleStack

struct HomeView: View {
    @Environment(NavigationRouter.self) var navRouter
    
    @State private var viewModel = HomeViewModel()
    
    private let shufflePublisher = PassthroughSubject<ShuffleDirection, Never>()
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        MainBackground {
            VStack(spacing: 0) {
                // MARK: Tool Bar
                VStack {
                    HStack {
                        Image("jamjam_main_text_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 85)
                            .padding(.leading, 35)
                            .padding(.top, 40)
                        
                        Spacer()
                        
                        Button {
                            navRouter.navigate(.loginView)
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 80, height: 32)
                                .foregroundStyle(Color.JJTitle)
                                .overlay {
                                    Text("로그인")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.white)
                                        .fontWeight(.bold)
                                }
                                .padding(.top, 40)
                                .padding(.trailing, 35)
                        }
                    }
                }
                .frame(height: 100)
                .background(.white)
                
                Divider()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        // MARK: Main Text
                        HStack {
                            Text("경험이 있는 손,\n지금 필요한 일에 연결해보세요")
                                .font(.system(size: 23))
                                .fontWeight(.black)
                                .multilineTextAlignment(.leading)
                                .padding(.top)
                                .padding(.leading, 35)
                            
                            Spacer()
                        }
                        .padding(.bottom, 17)
                        
                        // MARK: Search Bar
                        Button {
                            navRouter.navigate(.searchView)
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 42)
                                .padding(.horizontal, 35)
                                .foregroundStyle(.white)
                                .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
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
                        
                        // MARK: Shuffle Stack
                        ShuffleStack(viewModel.carouselCards) { card in
                            Image("\(card.image)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                
                        }
                        .shuffleTrigger(on: shufflePublisher)
                        .padding(.vertical, 30)
                        .onReceive(timer) { _ in
                            shufflePublisher.send(.right)
                        }
                        
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
                        }
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    HomeView()
        .environment(NavigationRouter())
}
