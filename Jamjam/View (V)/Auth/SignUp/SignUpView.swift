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
                                                        .font(.system(size: 15))
                                                        .fontWeight(.bold)
                                                        .foregroundStyle(.black)
                                                        .padding(.bottom, 10)
                                                    
                                                    Text("내가 잘해온 분야를 살려\n서비스를 등록하고\n활동하고 싶어요.")
                                                        .font(.system(size: 9))
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
                                                        .font(.system(size: 15))
                                                        .fontWeight(.bold)
                                                        .foregroundStyle(.black)
                                                        .padding(.bottom, 10)
                                                    
                                                    Text("지금 필요한 일에\n경험 있는 분의 손길을\n받아보고 싶어요.")
                                                        .font(.system(size: 9))
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
                                            .onChange(of: viewModel.nickname) {
                                                if viewModel.nickname.count == 0 {
                                                    viewModel.isNicknameNotification = false
                                                    
                                                } else {
                                                    viewModel.isNicknameNotification = true
                                                    viewModel.isNicknameRemoteNotification = false
                                                    
                                                    if viewModel.validateNicknameLocal() {
                                                        viewModel.isNicknameLocalValidated = true
                                                    } else {
                                                        viewModel.isNicknameLocalValidated = false
                                                    }
                                                }
                                            }
                                        
                                        Button {
                                            if viewModel.validateNicknameRemote() {
                                                viewModel.isNicknameNotification = true
                                                viewModel.isNicknameRemoteNotification = true
                                                viewModel.isNicknameFinalValidated = true
                                                focus = nil
                                                
                                            } else {
                                                viewModel.isNicknameNotification = true
                                                viewModel.isNicknameRemoteNotification = true
                                            }
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
                                                .opacity((viewModel.nickname.isEmpty || viewModel.nickname.count == 1) ? 0.4 : 1)
                                        }
                                        .disabled(viewModel.nickname.isEmpty || viewModel.nickname.count == 1)
                                    }
                                    .padding(.horizontal, 35)
                                    
                                    HStack {
                                        if viewModel.isNicknameNotification {
                                            if !viewModel.isNicknameLocalValidated {
                                                Text("10자 이내의 한글, 영문, 숫자 조합으로 입력해주세요.")
                                                    .font(.system(size: 12))
                                                    .foregroundStyle(.red)
                                            }
                                            
                                            if viewModel.isNicknameRemoteNotification {
                                                if viewModel.isNicknameFinalValidated {
                                                    Text("사용 가능한 닉네임 입니다.")
                                                        .font(.system(size: 12))
                                                        .foregroundStyle(.green)
                                                    
                                                } else {
                                                    Text("중복된 닉네임 입니다.")
                                                        .font(.system(size: 12))
                                                        .foregroundStyle(.red)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 40)
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
                                            .onChange(of: viewModel.id) {
                                                if viewModel.id.count == 0 {
                                                    viewModel.isIdNotification = false
                                                    
                                                } else {
                                                    viewModel.isIdNotification = true
                                                    viewModel.isIdRemoteNotification = false
                                                    
                                                    if viewModel.validateIdLocal() {
                                                        viewModel.isIdLocalValidated = true
                                                    } else {
                                                        viewModel.isIdLocalValidated = false
                                                    }
                                                }
                                            }
                                        
                                        Button {
                                            if viewModel.validateIdRemote() {
                                                viewModel.isIdNotification = true
                                                viewModel.isIdRemoteNotification = true
                                                viewModel.isIdFinalValidated = true
                                                focus = nil
                                                
                                            } else {
                                                viewModel.isIdNotification = true
                                                viewModel.isIdRemoteNotification = true
                                            }
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
                                                .opacity(viewModel.isIdLocalValidated ? 1 : 0.4)
                                        }
                                        .disabled(!viewModel.isIdLocalValidated)
                                    }
                                    .padding(.horizontal, 35)
                                    
                                    HStack {
                                        if viewModel.isIdNotification {
                                            if !viewModel.isIdLocalValidated {
                                                Text("소문자로 시작하고, 소문자와 숫자만 입력해주세요.")
                                                    .font(.system(size: 12))
                                                    .foregroundStyle(.red)
                                            }
                                            
                                            if viewModel.isIdRemoteNotification {
                                                if viewModel.isIdFinalValidated {
                                                    Text("사용 가능한 아이디 입니다.")
                                                        .font(.system(size: 12))
                                                        .foregroundStyle(.green)
                                                    
                                                } else {
                                                    Text("중복된 아이디 입니다.")
                                                        .font(.system(size: 12))
                                                        .foregroundStyle(.red)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 40)
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
                                                .onChange(of: viewModel.password) {
                                                    if viewModel.password.count == 0 {
                                                        viewModel.isPasswordNotification = false
                                                        
                                                    } else {
                                                        if viewModel.password.count >= 8 {
                                                            viewModel.isPasswordNotification = true
                                                            
                                                            if viewModel.validatePasswordLocal() {
                                                                viewModel.isPasswordFinalValidated = true
                                                                
                                                            } else {
                                                                viewModel.isPasswordFinalValidated = false
                                                            }
                                                        }
                                                    }
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
                                                .onChange(of: viewModel.password) {
                                                    if viewModel.password.count == 0 {
                                                        viewModel.isPasswordNotification = false
                                                        
                                                    } else {
                                                        viewModel.isPasswordNotification = true
                                                        
                                                        if viewModel.password.count >= 8 {
                                                            if viewModel.validatePasswordLocal() {
                                                                viewModel.isPasswordFinalValidated = true
                                                                
                                                            } else {
                                                                viewModel.isPasswordFinalValidated = false
                                                            }
                                                        }
                                                    }
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
                                    
                                    HStack {
                                        if viewModel.isPasswordNotification {
                                            if viewModel.isPasswordFinalValidated {
                                                Text("사용 가능한 비밀번호 입니다.")
                                                    .font(.system(size: 12))
                                                    .foregroundStyle(.green)
                                            } else {
                                                Text("영문과 숫자를 포함하여 8자 이상이어야 합니다.")
                                                    .font(.system(size: 12))
                                                    .foregroundStyle(.red)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 40)
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
                                        if viewModel.isConfirmPasswordSecured {
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
                                                .onChange(of: viewModel.confirmPassword) {
                                                    if viewModel.confirmPassword.count == 0 {
                                                        viewModel.isConfirmPasswordNotification = false
                                                        
                                                    } else {
                                                        viewModel.isConfirmPasswordNotification = true
                                                        
                                                        if viewModel.validateConfrimPasswordLocal() {
                                                            viewModel.isConfirmPasswordFinalValidated = true
                                                            
                                                        } else {
                                                            viewModel.isConfirmPasswordFinalValidated = false
                                                        }
                                                    }
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
                                                .onChange(of: viewModel.confirmPassword) {
                                                    if viewModel.confirmPassword.count == 0 {
                                                        viewModel.isConfirmPasswordNotification = false
                                                        
                                                    } else {
                                                        viewModel.isConfirmPasswordNotification = true
                                                        
                                                        if viewModel.validateConfrimPasswordLocal() {
                                                            viewModel.isConfirmPasswordFinalValidated = true
                                                            
                                                        } else {
                                                            viewModel.isConfirmPasswordFinalValidated = false
                                                        }
                                                    }
                                                }
                                                .padding(.horizontal, 35)
                                        }
                                        
                                        HStack {
                                            Spacer()
                                            
                                            Button {
                                                viewModel.isConfirmPasswordSecured.toggle()
                                            } label: {
                                                Image(systemName: viewModel.isConfirmPasswordSecured ? "eye" : "eye.slash")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 20)
                                                    .foregroundColor(.gray)
                                                    .padding(.trailing, 50)
                                            }
                                        }
                                    }
                                    
                                    HStack {
                                        if viewModel.isConfirmPasswordNotification {
                                            if viewModel.isConfirmPasswordFinalValidated {
                                                Text("비밀번호가 일치합니다.")
                                                    .font(.system(size: 12))
                                                    .foregroundStyle(.green)
                                            } else {
                                                Text("비밀번호가 일치하지 않습니다.")
                                                    .font(.system(size: 12))
                                                    .foregroundStyle(.red)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 40)
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
                                    
                                    TextField("홍길동", text: $viewModel.realName)
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
                                        .onChange(of: viewModel.realName) {
                                            if viewModel.validateRealNameLocal() {
                                                viewModel.isRealNameFinalValidated = true
                                                
                                            } else {
                                                viewModel.isRealNameFinalValidated = false
                                            }
                                        }
                                        .padding(.horizontal, 35)
                                    
                                    HStack {
                                        if viewModel.isRealNameNotification {
                                            if !viewModel.isRealNameFinalValidated {
                                                Text("한글로 2자 이상으로 입력해주세요.")
                                                    .font(.system(size: 12))
                                                    .foregroundStyle(.red)
                                            }
                                        }
                                            
                                        Spacer()
                                    }
                                    .padding(.leading, 40)
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
                                            .onChange(of: viewModel.birthYear) {
                                                if viewModel.validateBirthYearLocal() {
                                                    viewModel.isBirthYearLocalValidated = true
                                                    
                                                } else {
                                                    viewModel.isBirthYearLocalValidated = false
                                                }
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
                                            .onChange(of: viewModel.birthMonth) {
                                                if viewModel.validateBirthMonthLocal() {
                                                    viewModel.isBirthMonthLocalValidated = true
                                                    
                                                } else {
                                                    viewModel.isBirthMonthLocalValidated = false
                                                }
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
                                            .onChange(of: viewModel.birthDay) {
                                                if viewModel.validateBirthDayLocal() {
                                                    viewModel.isBirthDayLocalValidated = true
                                                    
                                                } else {
                                                    viewModel.isBirthDayLocalValidated = false
                                                }
                                            }
                                    }
                                    .padding(.horizontal, 35)
                                    
                                    HStack {
                                        if viewModel.isBirthNotification {
                                            if !viewModel.isBirthFinalValidated {
                                                Text("잘못된 날짜 형식입니다.")
                                                    .font(.system(size: 12))
                                                    .foregroundStyle(.red)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 40)
                                }
                                .padding(.bottom
                                )
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
                        
                        VStack {
                            
                        }
                        .frame(height: viewModel.pageIndex == 2 ? 90 : 50)
                    }
                }
                .scrollPosition($position)
                
                VStack {
                    Spacer()
                    
                    VStack {
                        // MARK: Bottom Button Page 1
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
                            
                            // MARK: Bottom Button Page 2
                        } else if viewModel.pageIndex == 1 {
                            HStack(spacing: 15) {
                                Button {
                                    viewModel.pageIndex = 0
                                    viewModel.signUpUserType = nil
                                    viewModel.isExpertButtonTapped = false
                                    viewModel.isClientButtonTapped = false
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
                                    viewModel.pageIndex = 2
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
                                        .opacity(viewModel.isAllValidatedInPage2 ? 1 : 0.4)
                                        .disabled(!viewModel.isAllValidatedInPage2)
                                        .padding(.trailing, 35)
                                }
                            }
                            .frame(height: 80)
                            .padding(.bottom, 81)
                            
                            // MARK: Bottom Button Page 3
                        } else if viewModel.pageIndex == 2 {
                            HStack(spacing: 15) {
                                Button {
                                    viewModel.pageIndex = 1
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
                                    // 완료
                                } label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 50)
                                        .foregroundStyle(Color.JJTitle)
                                        .overlay {
                                            Text("완료")
                                                .font(.system(size: 17))
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                        }
                                        .opacity(viewModel.isAllValidatedInPage3 ? 1 : 0.4)
                                        .disabled(!viewModel.isAllValidatedInPage3)
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
            .modifierIf(viewModel.pageIndex == 0, then: {
                NavigationBarBackAndTitleModifier(title: "회원 가입")
            }, else: {
                NavigationBarTitleAndHomeModifier(title: "회원 가입")
            })
            .background(Color.mainBackground)
        }
    }
}

#Preview {
    SignUpView()
        .environment(NavigationRouter())
        .environment(MainTabBarCapsule())
}
