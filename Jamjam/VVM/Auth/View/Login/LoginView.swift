//
//  LoginView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = LoginViewModel()
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack {
                    Image("jamjam_main_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90)
                        .padding(.top, 50)
                        .padding(.bottom, 50)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                    
                    VStack {
                        HStack {
                            Text("아이디")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        TextField("아이디를 입력해 주세요", text: $viewModel.loginId)
                            .focused($focus, equals: .first)
                            .font(.pretendard(size: 14))
                            .padding(.horizontal)
                            .frame(height: 50)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(focus == .first ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .first ? 1.5 : 1)
                            }
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom)
                    
                    VStack {
                        HStack {
                            Text("비밀번호")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        SecureField("비밀번호를 입력해 주세요", text: $viewModel.password)
                            .focused($focus, equals: .second)
                            .font(.pretendard(size: 14))
                            .padding(.horizontal)
                            .frame(height: 50)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(focus == .second ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .second ? 1.5 : 1)
                            }
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 25)
                    
                    Button {
                        viewModel.isEntireProgressViewVisible = true
                        viewModel.login()
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.JJTitle)
                            .padding(.horizontal, 20)
                            .frame(height: 45)
                            .overlay {
                                Text("로그인")
                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                    .foregroundStyle(.white)
                            }
                    }
                    .padding(.bottom, 30)
                    
                    HStack(spacing: 10) {
                        Button {
                            
                        } label: {
                            Text("아이디 찾기")
                                .font(.pretendard(size: 13))
                                .foregroundStyle(.gray)
                        }
                        
                        Text("|")
                            .font(.pretendard(size: 13))
                            .foregroundStyle(.gray)
                        
                        Button {
                            
                        } label: {
                            Text("비밀번호 찾기")
                                .font(.pretendard(size: 13))
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.bottom, 40)
                    
                    HStack(spacing: 20) {
                        Text("잼잼이 처음이신가요?")
                            .font(.pretendard(Pretendard.medium, size: 15))
                        
                        Button {
                            navRouter.navigate(.signUpView)
                        } label: {
                            Text("회원가입")
                                .font(.pretendard(Pretendard.semiBold, size: 15))
                                .foregroundStyle(Color.JJTitle)
                        }
                    }
                    
                    VStack {}
                    .frame(height: 50)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleModifier(title: "로그인"))
        .background(Color.mainBackground)
        .onTapGesture {
            focus = nil
        }
        .onChange(of: viewModel.isLoginCompleted) {
            navRouter.popToRoot()
        }
        .alert("로그인 실패", isPresented: $viewModel.isLoginAlertVisible) {
            Button {
                viewModel.loginAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
            } label: {
                Text("확인")
            }
        } message: {
            Text(viewModel.loginAlertMessage)
        }
        .overlay {
            if viewModel.isEntireProgressViewVisible {
                VStack {
                    ProgressView()
                        .scaleEffect(1.2)
                        .padding(.bottom, 30)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white.opacity(0.4))
            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
            .environment(NavigationCore())
    }
}
