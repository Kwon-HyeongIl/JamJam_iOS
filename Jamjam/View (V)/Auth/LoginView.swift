//
//  LoginView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = LoginViewModel()
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        MainBackground {
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
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .padding(.leading, 35)
                            
                            Spacer()
                        }
                        
                        TextField("아이디를 입력하세요", text: $viewModel.id)
                            .focused($focus, equals: .first)
                            .font(.system(size: 14))
                            .padding(.horizontal)
                            .frame(height: 50)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(focus == .first ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .first ? 1.5 : 1)
                            }
                            .padding(.horizontal, 35)
                    }
                    .padding(.bottom)
                    
                    VStack {
                        HStack {
                            Text("비밀번호")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .padding(.leading, 35)
                            
                            Spacer()
                        }
                        
                        SecureField("비밀번호를 입력하세요", text: $viewModel.password)
                            .focused($focus, equals: .second)
                            .font(.system(size: 14))
                            .padding(.horizontal)
                            .frame(height: 50)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(focus == .second ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .second ? 1.5 : 1)
                            }
                            .padding(.horizontal, 35)
                    }
                    .padding(.bottom, 25)
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.JJTitle)
                            .padding(.horizontal, 35)
                            .frame(height: 50)
                            .overlay {
                                Text("로그인")
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                            }
                    }
                    .padding(.bottom, 30)
                    
                    HStack(spacing: 10) {
                        Button {
                            
                        } label: {
                            Text("아이디 찾기")
                                .font(.system(size: 13))
                                .foregroundStyle(.gray)
                        }
                        
                        Text("|")
                            .font(.system(size: 13))
                            .foregroundStyle(.gray)
                        
                        Button {
                            
                        } label: {
                            Text("비밀번호 찾기")
                                .font(.system(size: 13))
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.bottom, 40)
                    
                    HStack(spacing: 20) {
                        Text("잼잼이 처음이신가요?")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                        
                        Button {
                            navRouter.navigate(.signUpView)
                        } label: {
                            Text("회원가입")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.JJTitle)
                        }
                    }
                    
                    VStack {
                        
                    }
                    .frame(height: 50)
                }
            }
            .modifier(NavigationBackAndTitleModifier(title: "로그인"))
            .background(Color.mainBackground)
            .onTapGesture {
                focus = nil
            }
        }
    }
}

#Preview {
    LoginView()
        .environment(NavigationRouter())
}
