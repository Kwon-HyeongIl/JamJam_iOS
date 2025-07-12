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
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                // MARK: Tool Bar
                VStack {
                    HStack {
                        Image("jamjam_main_text_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 85)
                            .padding(.leading, 20)
                            .padding(.top, 40)
                        
                        Spacer()
                        
                        if !viewModel.isLogin {
                            Button {
                                navRouter.navigate(.loginView)
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 64, height: 30)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        Text("로그인")
                                            .font(.pretendard(Pretendard.semiBold, size: 14))
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.top, 40)
                                    .padding(.trailing, 20)
                            }
                        }
                    }
                }
                .frame(height: 100)
                .background(Color.mainBackground)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        // MARK: Main Text
                        HStack {
                            Text("잊혀지는 경력이 아니라,\n이어지는 기회가 되도록")
                                .font(.pretendard(Pretendard.bold, size: 24))
                                .multilineTextAlignment(.leading)
                                .padding(.top)
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        .padding(.bottom, 17)
                        
                        // MARK: Search Bar
                        Button {
                            navRouter.navigate(.searchView)
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 44)
                                .padding(.horizontal, 20)
                                .foregroundStyle(.white)
                                .overlay {
                                    HStack {
                                        Text("필요한 손길을 찾아보세요")
                                            .font(.pretendard(size: 14))
                                            .foregroundStyle(.gray.opacity(0.8))
                                            .padding(.leading)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "magnifyingglass")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16)
                                            .foregroundStyle(Color.JJTitle)
                                            .padding(.trailing)
                                    }
                                    .padding(.horizontal, 20)
                                }
                                .shadow(color: .black.opacity(0.03), radius: 20, x: 0, y: 0)
                        }
                        
                        // MARK: Shuffle Stack
                        ShuffleStack(viewModel.carouselCards) { card in
                            Image("\(card.image)")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 190)
                                .frame(maxWidth: .infinity)
                                .frame(maxWidth: UIScreen.main.bounds.width - 95)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                        }
                        .shuffleOffset(30)
                        .shuffleScale(0)
                        .shuffleStyle(.rotateOut)
                        .shuffleTrigger(on: viewModel.shufflePublisher)
                        .padding(.vertical, 30)
                        
                        // MARK: Category
                        VStack(spacing: 15) {
                            HStack(spacing: 15) {
                                Button {
                                    navRouter.navigate(.categoryView(.management))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("business_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.management.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                                
                                Button {
                                    navRouter.navigate(.categoryView(.consulting))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("consulting_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.consulting.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            HStack(spacing: 15) {
                                Button {
                                    navRouter.navigate(.categoryView(.marketing))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("marketing_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.marketing.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                                
                                Button {
                                    navRouter.navigate(.categoryView(.development))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("development_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.development.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            HStack(spacing: 15) {
                                Button {
                                    navRouter.navigate(.categoryView(.design))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("design_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.design.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                                
                                Button {
                                    navRouter.navigate(.categoryView(.writing))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("write_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.writing.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            HStack(spacing: 15) {
                                Button {
                                    navRouter.navigate(.categoryView(.translation))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("translation_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.translation.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                                
                                Button {
                                    navRouter.navigate(.categoryView(.media))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("photograph_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.media.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            HStack(spacing: 15) {
                                Button {
                                    navRouter.navigate(.categoryView(.education))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("education_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.education.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                                
                                Button {
                                    navRouter.navigate(.categoryView(.customMade))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("craft_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.customMade.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            HStack(spacing: 15) {
                                Button {
                                    navRouter.navigate(.categoryView(.hobbyLesson))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("hobby_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.hobbyLesson.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                                
                                Button {
                                    navRouter.navigate(.categoryView(.lifeService))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 95)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("living_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 38)
                                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 0)
                                                
                                                Text(SkillCategory.lifeService.text)
                                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        VStack {}
                            .frame(height: 70)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .ignoresSafeArea(edges: .top)
        .onAppear {
            viewModel.timer
                .autoconnect()
                .sink { _ in
                    viewModel.shufflePublisher.send(.right)
                }
                .store(in: &viewModel.subscriptions)
        }
        .onDisappear {
            viewModel.subscriptions.removeAll()
        }
    }
}

#Preview {
    HomeView()
        .environment(NavigationCore())
}
