//
//  ProfileView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(NavigationCore.self) var navRouter
    @Environment(MainTabBarCapsule.self) var mainTabBarCapsule
    @State private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        Text("프로필")
                            .font(.pretendard(Pretendard.semiBold, size: 25))
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                }
                .frame(height: 50)
                .background(Color.mainBackground)
            }
            
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack {
                        HStack {
                            if viewModel.isLogin {
                                AsyncImage(url: URL(string: viewModel.user?.profileUrl ?? "")) { state in
                                    switch state {
                                    case .empty:
                                        Circle()
                                            .scaledToFit()
                                            .frame(width: 80)
                                            .foregroundStyle(.gray.opacity(0.5))
                                            .overlay {
                                                Image(systemName: "person")
                                                    .font(.system(size: 20))
                                                    .foregroundStyle(.gray)
                                            }
                                        
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80)
                                            .clipShape(Circle())
                                        
                                    case .failure:
                                        Circle()
                                            .scaledToFit()
                                            .frame(width: 80)
                                            .foregroundStyle(.gray.opacity(0.5))
                                        
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .padding(.leading)
                                
                            } else {
                                Circle()
                                    .scaledToFit()
                                    .frame(width: 80)
                                    .foregroundStyle(.gray.opacity(0.5))
                                    .overlay {
                                        Image(systemName: "person")
                                            .font(.system(size: 20))
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(.leading)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                if viewModel.isLogin {
                                    Text(viewModel.user?.nickname ?? "닉네임")
                                        .font(.pretendard(Pretendard.semiBold, size: 18))
                                    
                                } else {
                                    Button {
                                        navRouter.navigate(.loginView)
                                    } label: {
                                        HStack {
                                            Text("로그인하고 시작하기")
                                                .font(.pretendard(Pretendard.semiBold, size: 18))
                                                .foregroundStyle(.black)
                                            
                                            Image(systemName: "chevron.forward")
                                                .font(.system(size: 15))
                                                .foregroundStyle(.gray)
                                                .fontWeight(.semibold)
                                        }
                                    }
                                }
                                
                                if viewModel.isLogin {
                                    HStack {
                                        Text(viewModel.user?.role == .provider ? "전문가" : "고객")
                                            .font(.pretendard(Pretendard.medium, size: 12))
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.JJTitle)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    
                                } else {
                                    HStack {
                                        Text("비회원")
                                            .font(.pretendard(Pretendard.medium, size: 12))
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                            }
                            .padding(.leading)
                            
                            Spacer()
                        }
                        .padding(.top, 10)
                        .padding(.bottom)
                        
                        HStack {
                            HStack {
                                Text("보유 크레딧")
                                    .font(.pretendard(Pretendard.medium, size: 17))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 40)
                                
                                Spacer()
                                
                                if viewModel.isLogin {
                                    Text("\(viewModel.user?.credit ?? 0)원")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .foregroundStyle(.white)
                                        .padding(.trailing, 40)
                                    
                                } else {
                                    Text("0원")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .foregroundStyle(.white)
                                        .padding(.trailing, 40)
                                }
                            }
                        }
                        .frame(maxWidth:. infinity)
                        .frame(height: 45)
                        .background(Color.JJTitle)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.gray.opacity(0.1))
                    .frame(height: 190)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                    
                    VStack(spacing: 20) {
                        Button {
                            if viewModel.isLogin {
                                navRouter.navigate(.beforeCheckPasswordView)
                            } else {
                                viewModel.isLoginAlertVisible = true
                            }
                        } label: {
                            HStack {
                                Image(systemName: "info.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading, 20)
                                
                                Text("기본 정보 수정")
                                    .font(.pretendard(size: 16))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 20)
                                    .foregroundStyle(.gray)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        Button {
                            if viewModel.isLogin {
                                navRouter.navigate(.editProviderProfileView)
                            } else {
                                viewModel.isLoginAlertVisible = true
                            }
                        } label: {
                            HStack {
                                Image(systemName: "person.text.rectangle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading, 20)
                                
                                Text("전문가 프로필 수정")
                                    .font(.pretendard(size: 16))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 20)
                                    .foregroundStyle(.gray)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        Button {
                            if viewModel.isLogin {
                                
                            } else {
                                viewModel.isLoginAlertVisible = true
                            }
                        } label: {
                            HStack {
                                Image(systemName: "list.bullet")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading, 20)
                                
                                Text("서비스 관리")
                                    .font(.pretendard(size: 16))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 20)
                                    .foregroundStyle(.gray)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        Button {
                            if viewModel.isLogin {
                                
                            } else {
                                viewModel.isLoginAlertVisible = true
                            }
                        } label: {
                            HStack {
                                Image(systemName: "dollarsign.arrow.trianglehead.counterclockwise.rotate.90")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading, 20)
                                
                                Text("수익 관리")
                                    .font(.pretendard(size: 16))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 20)
                                    .foregroundStyle(.gray)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        Button {
                            navRouter.navigate(.editNotificationView)
                        } label: {
                            HStack {
                                Image(systemName: "bell")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading, 20)
                                
                                Text("알림 설정")
                                    .font(.pretendard(size: 16))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 20)
                                    .foregroundStyle(.gray)
                            }
                            .foregroundStyle(.black)
                        }
                    }
                    
                    HStack {
                        Text("v1.0.0")
                            .font(.pretendard(size: 12))
                            .foregroundStyle(.gray)
                        
                        if viewModel.isLogin {
                            Text("/")
                                .font(.pretendard(size: 12))
                                .foregroundStyle(.gray)
                            
                            Button {
                                viewModel.isLogoutAlertVisible = true
                            } label: {
                                Text("로그아웃")
                                    .font(.pretendard(size: 12))
                                    .underline()
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .padding(.top, 50)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .alert("알림", isPresented: $viewModel.isLoginAlertVisible) {
            Button {
                
            } label: {
                Text("확인")
            }
        } message: {
            Text("로그인이 필요한 서비스입니다.")
        }
        .alert("알림", isPresented: $viewModel.isLogoutAlertVisible) {
            Button(role: .cancel) {} label: {
                Text("취소")
            }
            
            Button(role: .destructive) {
                viewModel.logout()
                mainTabBarCapsule.selectedTab = .home
            } label: {
                Text("확인")
            }
        } message: {
            Text("로그아웃 하시겠습니까?")
        }
        .onAppear {
            if !viewModel.isUserInit {
                viewModel.fetchUserInfo()
                viewModel.isUserInit = true
            }
        }
    }
    
    
}

#Preview {
    ProfileView()
        .environment(NavigationCore())
        .environment(MainTabBarCapsule())
}
