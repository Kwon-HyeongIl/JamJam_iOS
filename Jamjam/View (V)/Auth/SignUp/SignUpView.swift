//
//  SignUpView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var viewModel = SignUpViewModel()
    
    @State private var position = ScrollPosition()
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        MainBackground {
            ZStack {
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
                                if !viewModel.isExpertButtonTappedNoAni && !viewModel.isClientButtonTappedNoAni {
                                    Text("잼잼에 오신 걸 환영해요.\n어떤 역할로 함께 하시겠어요?")
                                        .font(.system(size: 23))
                                        .fontWeight(.black)
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom, 25)
                                    
                                } else if viewModel.isExpertButtonTappedNoAni {
                                    Text("잼잼 전문가로 가입하고\n당신의 경험을 다시 연결해보세요")
                                        .font(.system(size: 23))
                                        .fontWeight(.black)
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom, 25)
                                    
                                } else if viewModel.isClientButtonTappedNoAni {
                                    Text("잼잼 의뢰인으로 가입하고\n당신에게 꼭 맞는 손길을 만나보세요")
                                        .font(.system(size: 23))
                                        .fontWeight(.black)
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom, 25)
                                }
                                
                                HStack(spacing: 15) {
                                    Button {
                                        withAnimation {
                                            if viewModel.isClientButtonTapped {
                                                viewModel.isClientButtonTapped = false
                                            }
                                            viewModel.isExpertButtonTapped.toggle()
                                        }
                                        
                                        if viewModel.isClientButtonTappedNoAni {
                                            viewModel.isClientButtonTappedNoAni = false
                                        }
                                        viewModel.isExpertButtonTappedNoAni.toggle()
                                        
                                        viewModel.signUpUserType = .expert
                                    } label: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundStyle(viewModel.isExpertButtonTapped ? .red.opacity(0.1) : .white)
                                            .scaledToFit()
                                            .overlay {
                                                VStack {
                                                    Image(viewModel.isExpertButtonTapped ? "expert_tint_icon" : "expert_icon")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 35)
                                                        .padding(.bottom, 8)
                                                    
                                                    Text("경험을 나누고 싶은 분")
                                                        .font(.system(size: 16))
                                                        .fontWeight(.bold)
                                                        .foregroundStyle(.black)
                                                        .padding(.bottom)
                                                    
                                                    Text("내가 잘해온 분야를 살려\n서비스를 등록하고\n활동하고 싶어요.")
                                                        .font(.system(size: 10))
                                                        .foregroundStyle(.gray)
                                                }
                                                .padding(5)
                                            }
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(viewModel.isExpertButtonTapped ? Color.JJTitle : .gray.opacity(0.5), lineWidth: 1.5)
                                            }
                                            .padding(.leading, 35)
                                    }
                                    
                                    Button {
                                        withAnimation {
                                            if viewModel.isExpertButtonTapped {
                                                viewModel.isExpertButtonTapped = false
                                            }
                                            viewModel.isClientButtonTapped.toggle()
                                        }
                                        
                                        if viewModel.isExpertButtonTappedNoAni {
                                            viewModel.isExpertButtonTappedNoAni = false
                                        }
                                        viewModel.isClientButtonTappedNoAni.toggle()
                                        
                                        viewModel.signUpUserType = .client
                                    } label: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundStyle(viewModel.isClientButtonTapped ? .red.opacity(0.1) : .white)
                                            .scaledToFit()
                                            .overlay {
                                                VStack {
                                                    Image(viewModel.isClientButtonTapped ? "client_tint_icon" : "client_icon")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 35)
                                                        .padding(.bottom, 8)
                                                    
                                                    Text("도움을 받고 싶은 분")
                                                        .font(.system(size: 16))
                                                        .fontWeight(.bold)
                                                        .foregroundStyle(.black)
                                                        .padding(.bottom)
                                                    
                                                    Text("지금 필요한 일에\n경험 있는 분의 손길을 받아보고 싶어요.")
                                                        .font(.system(size: 10))
                                                        .foregroundStyle(.gray)
                                                }
                                                .padding(5)
                                            }
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(viewModel.isClientButtonTapped ? Color.JJTitle : .gray.opacity(0.5), lineWidth: 1.5)
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
                            }
                            
                        // MARK: Page 3
                        } else if viewModel.pageIndex == 2 {
                            VStack {
                                Text("잼잼 서비스 이용을 위해\n개인 정보를 입력해 주세요.")
                                    .font(.system(size: 23))
                                    .fontWeight(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 25)
                                
                                VStack {
                                    HStack {
                                        Text("이름")
                                            .font(.system(size: 17))
                                            .fontWeight(.semibold)
                                            .padding(.leading, 35)
                                        
                                        Spacer()
                                    }
                                    
                                    TextField("홍길동", text: $viewModel.name)
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
                                        Text("생년월일")
                                            .font(.system(size: 17))
                                            .fontWeight(.semibold)
                                            .padding(.leading, 35)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        TextField("년도", text: $viewModel.birthYear)
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
                                            
                                        TextField("월", text: $viewModel.birthMonth)
                                            .focused($focus, equals: .third)
                                            .font(.system(size: 14))
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .frame(maxWidth: 75)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(focus == .third ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .third ? 1.5 : 1)
                                            }
                                        
                                        TextField("일", text: $viewModel.birthDay)
                                            .focused($focus, equals: .fourth)
                                            .font(.system(size: 14))
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .frame(maxWidth: 75)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(focus == .fourth ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .fourth ? 1.5 : 1)
                                            }
                                    }
                                    .padding(.horizontal, 35)
                                    .padding(.bottom)
                                    
                                    VStack {
                                        HStack {
                                            Text("성별")
                                                .font(.system(size: 17))
                                                .fontWeight(.semibold)
                                                .padding(.leading, 35)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Button {
                                                withAnimation {
                                                    if viewModel.isGenderWomanButtonTapped {
                                                        viewModel.isGenderWomanButtonTapped = false
                                                    }
                                                    viewModel.isGenderManButtonTapped.toggle()
                                                }
                                                viewModel.gender = .man
                                            } label: {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(height: 50)
                                                    .foregroundStyle(viewModel.isGenderManButtonTapped ? .red.opacity(0.1) : .white)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                    .overlay {
                                                        Image(viewModel.isGenderManButtonTapped ? "man_tint_icon" : "man_icon")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 20)
                                                    }
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(viewModel.isGenderManButtonTapped ? Color.JJTitle : .gray.opacity(0.5), lineWidth: viewModel.isGenderManButtonTapped ? 1.5 : 1)
                                                    }
                                            }
                                            
                                            Button {
                                                withAnimation {
                                                    if viewModel.isGenderManButtonTapped {
                                                        viewModel.isGenderManButtonTapped = false
                                                    }
                                                    viewModel.isGenderWomanButtonTapped.toggle()
                                                }
                                                viewModel.gender = .woman
                                            } label: {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(height: 50)
                                                    .foregroundStyle(viewModel.isGenderWomanButtonTapped ? .red.opacity(0.1) : .white)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                    .overlay {
                                                        Image(viewModel.isGenderWomanButtonTapped ? "woman_tint_icon" : "woman_icon")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 20)
                                                    }
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(viewModel.isGenderWomanButtonTapped ? Color.JJTitle : .gray.opacity(0.5), lineWidth: viewModel.isGenderWomanButtonTapped ? 1.5 : 1)
                                                    }
                                            }
                                        }
                                        .padding(.horizontal, 35)
                                    }
                                    .padding(.bottom)
                                    
                                    VStack {
                                        HStack {
                                            Text("휴대폰 번호")
                                                .font(.system(size: 17))
                                                .fontWeight(.semibold)
                                                .padding(.leading, 35)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            TextField("하이픈(-) 제외하고 입력", text: $viewModel.phoneNumber)
                                                .focused($focus, equals: .fifth)
                                                .font(.system(size: 14))
                                                .padding(.horizontal)
                                                .frame(height: 50)
                                                .background(.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(focus == .fifth ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .fifth ? 1.5 : 1)
                                                }
                                            
                                            Button {
                                                withAnimation {
                                                    viewModel.isIdentifiedButtonTapped = true
                                                    position.scrollTo(edge: .bottom)
                                                }
                                            } label: {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(maxWidth: 100)
                                                    .foregroundStyle(Color.JJTitle)
                                                    .overlay {
                                                        Text("인증번호 받기")
                                                            .font(.system(size: 14))
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(.white)
                                                    }
                                                    .opacity(viewModel.phoneNumber.count == 11 ? 1 : 0.4)
                                            }
                                        }
                                        .padding(.horizontal, 35)
                                    }
                                    .padding(.bottom)
                                    
                                    if viewModel.isIdentifiedButtonTapped {
                                        VStack {
                                            HStack {
                                                Text("인증번호")
                                                    .font(.system(size: 17))
                                                    .fontWeight(.semibold)
                                                    .padding(.leading, 35)
                                                
                                                Spacer()
                                            }
                                            
                                            TextField("인증번호 6자리를 입력해 주세요", text: $viewModel.identifiedNumber)
                                                .focused($focus, equals: .sixth)
                                                .font(.system(size: 14))
                                                .padding(.horizontal)
                                                .frame(height: 50)
                                                .background(.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(focus == .sixth ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .sixth ? 1.5 : 1)
                                                }
                                                .padding(.horizontal, 35)
                                        }
                                    }
                                }
                            }
                        }
                        
                        VStack {
                            
                        }
                        .frame(height: viewModel.pageIndex == 2 ? 90 : 50)
                    }
                }
                .scrollPosition($position)
                
                VStack {
                    Spacer()
                    
                    VStack {
                        if viewModel.pageIndex == 0 {
                            Button {
                                viewModel.pageIndex = 1
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
                                    .opacity((viewModel.isExpertButtonTapped || viewModel.isClientButtonTapped) ? 1 : 0.4)
                                    .padding(.horizontal, 35)
                            }
                            .disabled(!(viewModel.isExpertButtonTapped || viewModel.isClientButtonTapped))
                            .padding(.bottom, 75)
                            
                        } else {
                            HStack(spacing: 15) {
                                Button {
                                    if viewModel.pageIndex == 1 {
                                        viewModel.pageIndex = 0
                                        viewModel.signUpUserType = nil
                                        
                                    } else if viewModel.pageIndex == 2 {
                                        viewModel.pageIndex = 1
                                    }
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
                                        .padding(.leading, 35)
                                }
                                
                                Button {
                                    if viewModel.pageIndex == 1 {
                                        viewModel.pageIndex = 2
                                        
                                    } else if viewModel.pageIndex == 2 {
                                        // 완료
                                    }
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 50)
                                        .foregroundStyle(Color.JJTitle)
                                        .overlay {
                                            Text(viewModel.pageIndex == 2 ? "완료" : "다음")
                                                .font(.system(size: 17))
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                        }
                                        .padding(.trailing, 35)
                                }
                            }
                            .frame(height: 80)
                            .padding(.bottom, 81)
                        }
                    }
                    .frame(height: 150)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .offset(y: 79)
                }
            }
            .modifier(NavigationBackAndTitleModifier(title: "회원 가입"))
            .background(Color.mainBackground)
        }
    }
}

#Preview {
    SignUpView()
        .environment(NavigationRouter())
}
