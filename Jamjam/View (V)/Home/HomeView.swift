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
                                .padding(.trailing, 18)
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
                                .font(.custom("Pretendard-Bold", size: 23))
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
                                            .font(.system(size: 13))
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
                                .scaledToFill()
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                        }
                        .shuffleOffset(27)
                        .shuffleScale(0.1)
                        .shuffleTrigger(on: viewModel.shufflePublisher)
                        .padding(.vertical, 25)
                        
                        // MARK: Category
                        VStack(spacing: 10) {
                            HStack(spacing: 15) {
                                Button {
                                    navRouter.navigate(.categoryView)
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.3), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("business_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
                                                Text("경영•기획")
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .frame(height: 80)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    }
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image("consulting_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 33)
                                            
                                            Text("컨설팅•멘토링")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                        }
                                    }
                            }
                            .padding(.horizontal, 35)
                            
                            HStack(spacing: 15) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .frame(height: 80)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    }
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image("marketing_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 33)
                                            
                                            Text("마케팅•홍보")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                        }
                                    }
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .frame(height: 80)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    }
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image("development_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 33)
                                            
                                            Text("개발•IT")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                        }
                                    }
                            }
                            .padding(.horizontal, 35)
                            
                            HStack(spacing: 15) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .frame(height: 80)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    }
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image("design_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 33)
                                            
                                            Text("디자인•편집")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                        }
                                    }
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .frame(height: 80)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    }
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image("write_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 33)
                                            
                                            Text("문서•작문")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                        }
                                    }
                            }
                            .padding(.horizontal, 35)
                            
                            HStack(spacing: 15) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .frame(height: 80)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    }
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image("translation_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 33)
                                            
                                            Text("번역•통역")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                        }
                                    }
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .frame(height: 80)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    }
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image("photograph_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 33)
                                            
                                            Text("사진•영상")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                        }
                                    }
                            }
                            .padding(.horizontal, 35)
                            
                            HStack(spacing: 15) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .frame(height: 80)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    }
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image("education_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 33)
                                            
                                            Text("교육•강의")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                        }
                                    }
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .frame(height: 80)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    }
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image("craft_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 33)
                                            
                                            Text("주문 제작")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                        }
                                    }
                            }
                            .padding(.horizontal, 35)
                            
                            HStack(spacing: 15) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .frame(height: 80)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    }
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image("hobby_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 33)
                                            
                                            Text("취미 레슨")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                        }
                                    }
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .frame(height: 80)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    }
                                    .overlay {
                                        VStack(spacing: 7) {
                                            Image("living_icon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 33)
                                            
                                            Text("생활 서비스")
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black)
                                        }
                                    }
                            }
                            .padding(.horizontal, 35)
                        }
                        
                        VStack {}
                        .frame(height: 70)
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            // MARK: OnAppear
            .onAppear {
                viewModel.timer
                    .autoconnect()
                    .sink { _ in
                        viewModel.shufflePublisher.send(.right)
                    }
                    .store(in: &viewModel.subscriptions)
            }
            // MARK: OnDisappear
            .onDisappear {
                viewModel.subscriptions.removeAll()
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(NavigationRouter())
}
