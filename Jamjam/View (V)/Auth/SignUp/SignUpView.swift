//
//  SignUpView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var viewModel = SignUpViewModel()
    
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
                        .padding(.bottom, 30)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                        .padding(.bottom, 5)
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 5)
                            .foregroundStyle(((viewModel.pageIndex == 0) || (viewModel.pageIndex == 1) || (viewModel.pageIndex == 2)) ? Color.JJTitle : .gray.opacity(0.7))
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 5)
                            .foregroundStyle(((viewModel.pageIndex == 1) || (viewModel.pageIndex == 2)) ? Color.JJTitle : .gray.opacity(0.7))
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 5)
                            .foregroundStyle(viewModel.pageIndex == 2 ? Color.JJTitle : .gray.opacity(0.7))
                    }
                    .padding(.bottom, 30)
                    
                    // MARK: Page 1
                    if viewModel.pageIndex == 0 {
                        VStack {
                            Text("잼잼에 오신 걸 환영해요.\n어떤 역할로 함께 하시겠어요?")
                                .font(.system(size: 23))
                                .fontWeight(.black)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 25)
                            
                            HStack(spacing: 15) {
                                Button {
                                    withAnimation {
                                        viewModel.pageIndex = 1
                                    }
                                    viewModel.signUpUserType = .expert
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .scaledToFit()
                                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                                        .overlay {
                                            VStack {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .scaledToFit()
                                                    .frame(width: 30)
                                                    .foregroundStyle(Color.JJTitle)
                                                    .padding(.bottom)
                                                
                                                Text("경험을 나누고 싶은 분")
                                                    .font(.system(size: 16))
                                                    .fontWeight(.bold)
                                                    .foregroundStyle(.black)
                                                    .padding(.bottom)
                                                
                                                Text("내가 잘해온 분야를 살려\n서비스를 등록하고 활동하고 싶어요.")
                                                    .font(.system(size: 10))
                                                    .foregroundStyle(.gray)
                                            }
                                        }
                                        .padding(.leading, 35)
                                }
                                
                                Button {
                                    withAnimation {
                                        viewModel.pageIndex = 1
                                    }
                                    viewModel.signUpUserType = .client
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .scaledToFit()
                                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                                        .overlay {
                                            VStack {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .scaledToFit()
                                                    .frame(width: 30)
                                                    .foregroundStyle(Color.JJTitle)
                                                    .padding(.bottom)
                                                
                                                Text("도움을 받고 싶은 분")
                                                    .font(.system(size: 16))
                                                    .fontWeight(.bold)
                                                    .foregroundStyle(.black)
                                                    .padding(.bottom)
                                                
                                                Text("지금 필요한 일에\n경험 있는 분의 손길을 받아보고 싶어요.")
                                                    .font(.system(size: 10))
                                                    .foregroundStyle(.gray)
                                            }
                                        }
                                        .padding(.trailing, 35)
                                    
                                }
                            }
                        }
                        
                        // MARK: Page 2
                    } else if viewModel.pageIndex == 1 {
                        VStack {
                            Text("계정 정보를 입력하고,\n이어서 진행해 주세요.")
                                .font(.system(size: 23))
                                .fontWeight(.black)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 25)
                            
                            VStack {
                                HStack {
                                    Text("닉네임")
                                        .font(.system(size: 17))
                                        .fontWeight(.semibold)
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    TextField("10자 이내의 한글, 영문, 숫자 조합", text: $viewModel.nickname)
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
                                    
                                    Button {
                                        
                                    } label: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(maxWidth: 80)
                                            .foregroundStyle(Color.JJTitle)
                                            .overlay {
                                                Text("중복 확인")
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.white)
                                            }
                                            .opacity(viewModel.nickname.isEmpty ? 0.4 : 1)
                                    }
                                }
                                .padding(.horizontal, 35)
                            }
                            .padding(.bottom)
                            
                            VStack {
                                HStack {
                                    Text("아이디")
                                        .font(.system(size: 17))
                                        .fontWeight(.semibold)
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    TextField("소문자로 시작, 소문자와 숫자만 허용", text: $viewModel.id)
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
                                    
                                    Button {
                                        
                                    } label: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(maxWidth: 80)
                                            .foregroundStyle(Color.JJTitle)
                                            .overlay {
                                                Text("중복 확인")
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.white)
                                            }
                                            .opacity(viewModel.id.isEmpty ? 0.4 : 1)
                                    }
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
                                ZStack {
                                    if viewModel.isPasswordSecured {
                                        SecureField("영문과 숫자를 포함한 최소 8자", text: $viewModel.password)
                                            .focused($focus, equals: .third)
                                            .font(.system(size: 14))
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(focus == .third ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .third ? 1.5 : 1)
                                            }
                                            .padding(.horizontal, 35)
                                        
                                    } else {
                                        TextField("영문과 숫자를 포함한 최소 8자", text: $viewModel.password)
                                            .focused($focus, equals: .third)
                                            .font(.system(size: 14))
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(focus == .third ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .third ? 1.5 : 1)
                                            }
                                            .padding(.horizontal, 35)
                                    }
                                    
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            viewModel.isPasswordSecured.toggle()
                                        } label: {
                                            Image(systemName: viewModel.isPasswordSecured ? "eye" : "eye.slash")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20)
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 50)
                                        }
                                    }
                                }
                            }
                            .padding(.bottom)
                            
                            VStack {
                                HStack {
                                    Text("비밀번호 확인")
                                        .font(.system(size: 17))
                                        .fontWeight(.semibold)
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                ZStack {
                                    if viewModel.isConfrimPasswordSecured {
                                        SecureField("비밀번호를 한번 더 입력해 주세요", text: $viewModel.confirmPassword)
                                            .focused($focus, equals: .fourth)
                                            .font(.system(size: 14))
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(focus == .fourth ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .fourth ? 1.5 : 1)
                                            }
                                            .padding(.horizontal, 35)
                                        
                                    } else {
                                        TextField("비밀번호를 한번 더 입력해 주세요", text: $viewModel.confirmPassword)
                                            .focused($focus, equals: .fourth)
                                            .font(.system(size: 14))
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(focus == .fourth ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .fourth ? 1.5 : 1)
                                            }
                                            .padding(.horizontal, 35)
                                    }
                                    
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            viewModel.isConfrimPasswordSecured.toggle()
                                        } label: {
                                            Image(systemName: viewModel.isConfrimPasswordSecured ? "eye" : "eye.slash")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20)
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 50)
                                        }
                                    }
                                }
                            }
                            .padding(.bottom, 30)
                            
                            HStack(spacing: 15) {
                                Button {
                                    
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 50)
                                        .foregroundStyle(.white)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                                        }
                                        .overlay {
                                            Text("이전")
                                                .font(.system(size: 17))
                                                .foregroundStyle(.gray)
                                                .fontWeight(.semibold)
                                        }
                                }
                                
                                Button {
                                    
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 50)
                                        .foregroundStyle(Color.JJTitle)
                                        .overlay {
                                            Text("다음")
                                                .font(.system(size: 17))
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                        }
                                }
                            }
                            .padding(.horizontal, 35)
                        }
                    }
                    
                    VStack {
                        
                    }
                    .frame(height: 50)
                }
            }
            .modifier(NavigationBackAndTitleModifier(title: "회원 가입"))
        }
    }
}

#Preview {
    SignUpView()
        .environment(NavigationRouter())
}
