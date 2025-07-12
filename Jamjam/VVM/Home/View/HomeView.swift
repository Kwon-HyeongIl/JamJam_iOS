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
                            Text("경험이 있는 손,\n지금 필요한 일에 연결해보세요")
                                .font(.pretendard(Pretendard.bold, size: 23))
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
                                .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                                .overlay {
                                    HStack {
                                        Text("필요한 손길을 찾아보세요")
                                            .font(.pretendard(size: 14))
                                            .foregroundStyle(.gray)
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
                        }
                        
                        // MARK: Shuffle Stack
                        ShuffleStack(viewModel.carouselCards) { card in
                            Image("\(card.image)")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 170)
                                .frame(maxWidth: UIScreen.main.bounds.width - 130)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                        }
                        .shuffleOffset(27)
                        .shuffleScale(0.1)
                        .shuffleTrigger(on: viewModel.shufflePublisher)
                        .padding(.vertical, 32)
                        
                        // MARK: Category
                        VStack(spacing: 12) {
                            HStack(spacing: 15) {
                                Button {
                                    navRouter.navigate(.categoryView(.management))
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("business_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("consulting_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("marketing_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("development_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("design_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("write_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("translation_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("photograph_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("education_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("craft_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("hobby_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
                                        .frame(height: 80)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        }
                                        .overlay {
                                            VStack(spacing: 7) {
                                                Image("living_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 33)
                                                
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
