//
//  SignUpView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct SignUpView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = SignUpViewModel()
    
    @State private var position = ScrollPosition()
    
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
                            .foregroundStyle(((viewModel.pageIndex == 0) || (viewModel.pageIndex == 1) || (viewModel.pageIndex == 2)) ? Color.JJTitle : .gray.opacity(0.6))
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 5)
                            .foregroundStyle(((viewModel.pageIndex == 1) || (viewModel.pageIndex == 2)) ? Color.JJTitle : .gray.opacity(0.6))
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 5)
                            .foregroundStyle(viewModel.pageIndex == 2 ? Color.JJTitle : .gray.opacity(0.6))
                    }
                    .padding(.bottom, 30)
                    
                    // MARK: Page 1
                    if viewModel.pageIndex == 0 {
                        VStack {
                            if !viewModel.isExpertButtonTappedNoAni && !viewModel.isClientButtonTappedNoAni {
                                Text("잼잼에 오신 걸 환영해요.\n어떤 역할로 함께 하시겠어요?")
                                    .font(.pretendard(Pretendard.extraBold, size: 23))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 25)
                                
                            } else if viewModel.isExpertButtonTappedNoAni {
                                Text("잼잼 전문가로 가입하고\n당신의 경험을 다시 연결해보세요")
                                    .font(.pretendard(Pretendard.extraBold, size: 23))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 25)
                                
                            } else if viewModel.isClientButtonTappedNoAni {
                                Text("잼잼 의뢰인으로 가입하고\n당신에게 꼭 맞는 손길을 만나보세요")
                                    .font(.pretendard(Pretendard.extraBold, size: 23))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 25)
                            }
                            
                            HStack(spacing: 15) {
                                Button {
                                    withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
                                        if viewModel.isClientButtonTapped {
                                            viewModel.isClientButtonTapped = false
                                        }
                                        viewModel.isExpertButtonTapped.toggle()
                                    }
                                    
                                    if viewModel.isClientButtonTappedNoAni {
                                        viewModel.isClientButtonTappedNoAni = false
                                    }
                                    viewModel.isExpertButtonTappedNoAni.toggle()
                                    
                                    viewModel.signUpUserType = .provider
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
                                                    .font(.pretendard(Pretendard.bold, size: 15))
                                                    .foregroundStyle(.black)
                                                    .padding(.bottom, 10)
                                                
                                                Text("내가 잘해온 분야를 살려\n서비스를 등록하고\n활동하고 싶어요.")
                                                    .font(.pretendard(size: 9))
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
                                    withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
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
                                                    .font(.pretendard(Pretendard.bold, size: 15))
                                                    .foregroundStyle(.black)
                                                    .padding(.bottom, 10)
                                                
                                                Text("지금 필요한 일에\n경험 있는 분의 손길을\n받아보고 싶어요.")
                                                    .font(.pretendard(size: 9))
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
                                .font(.pretendard(Pretendard.extraBold, size: 23))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 25)
                            
                            VStack {
                                HStack {
                                    Text("닉네임")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    TextField("2자 이상 입력해주세요", text: $viewModel.nickname)
                                        .focused($focus, equals: .first)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 50)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .first ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .first ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.nickname) {
                                            viewModel.restoreNicknameRelated()
                                            
                                            if viewModel.nickname.count == 1 {
                                                viewModel.isNicknameFailedNoti3 = true
                                            }
                                        }
                                    
                                    Button {
                                        if viewModel.validateNicknameForm() {
                                            viewModel.checkNicknameIsDuplicated()
                                        } else {
                                            viewModel.isNicknameFailedNoti3 = true
                                        }
                                    } label: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(maxWidth: 80)
                                            .foregroundStyle(Color.JJTitle)
                                            .overlay {
                                                Text("중복 확인")
                                                    .font(.pretendard(Pretendard.semiBold, size: 14))
                                                    .foregroundStyle(.white)
                                            }
                                            .opacity(viewModel.nickname.count < 2 ? 0.4 : 1)
                                    }
                                    .disabled(viewModel.nickname.count < 2)
                                    .onChange(of: viewModel.isNicknameFinalValidated) {
                                        if viewModel.isNicknameFinalValidated {
                                            focus = nil
                                        }
                                    }
                                }
                                .padding(.horizontal, 35)
                                
                                HStack {
                                    if viewModel.isNicknameFinalValidated {
                                        Text("사용 가능한 닉네임 입니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.green)
                                        
                                    } else if viewModel.isNicknameFailedNoti1 {
                                        Text("중복된 닉네임 입니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                        
                                    } else if viewModel.isNicknameFailedNoti2 {
                                        Text("통신에 문제가 생겼습니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                        
                                    } else if viewModel.isNicknameFailedNoti3 {
                                        Text("10자 이내의 한글, 영문, 숫자 조합으로 입력해주세요.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                        
                                    } else if viewModel.isNicknameFailedNoti4 {
                                        Text("2자 이상으로 입력해주세요.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.leading, 40)
                            }
                            .padding(.bottom)
                            
                            VStack {
                                HStack {
                                    Text("아이디")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    TextField("소문자로 시작, 소문자와 숫자만 허용", text: $viewModel.loginId)
                                        .focused($focus, equals: .second)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 50)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .second ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .second ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.loginId) {
                                            viewModel.restoreIdRelated()
                                            
                                            if viewModel.loginId.count >= 1 && viewModel.loginId.count < 4 {
                                                viewModel.isloginIdFailedNoti4 = false
                                            }
                                        }
                                    
                                    Button {
                                        if viewModel.validateIdForm() {
                                            viewModel.checkIdIsDuplicated()
                                        } else {
                                            viewModel.isloginIdFailedNoti3 = true
                                        }
                                    } label: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(maxWidth: 80)
                                            .foregroundStyle(Color.JJTitle)
                                            .overlay {
                                                Text("중복 확인")
                                                    .font(.pretendard(Pretendard.semiBold, size: 14))
                                                    .foregroundStyle(.white)
                                            }
                                            .opacity(viewModel.loginId.count > 4 ? 1 : 0.4)
                                    }
                                    .disabled(viewModel.loginId.count < 4)
                                    .onChange(of: viewModel.isloginIdFinalValidated) {
                                        if viewModel.isloginIdFinalValidated {
                                            focus = nil
                                        }
                                    }
                                }
                                .padding(.horizontal, 35)
                                
                                HStack {
                                    if viewModel.isloginIdFinalValidated {
                                        Text("사용 가능한 아이디 입니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.green)
                                        
                                    } else if viewModel.isloginIdFailedNoti1 {
                                        Text("중복된 아이디 입니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                        
                                    }else if viewModel.isloginIdFailedNoti2 {
                                        Text("통신에 문제가 생겼습니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                        
                                    } else if viewModel.isloginIdFailedNoti3 {
                                        Text("소문자로 시작 및 소문자와 숫자만 허용됩니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                        
                                    } else if viewModel.isloginIdFailedNoti4 {
                                        Text("4자 이상으로 입력해주세요.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.leading, 40)
                            }
                            .padding(.bottom)
                            
                            VStack {
                                HStack {
                                    Text("비밀번호")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                ZStack {
                                    if viewModel.isPasswordSecured {
                                        SecureField("영문과 숫자를 포함한 최소 8자", text: $viewModel.password)
                                            .focused($focus, equals: .third)
                                            .font(.pretendard(size: 14))
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(focus == .third ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .third ? 1.5 : 1)
                                            }
                                            .onChange(of: viewModel.password) {
                                                viewModel.restorePasswordRelated()
                                                
                                                if viewModel.validatePasswordForm() {
                                                    viewModel.isPasswordFinalValidated = true
                                                } else {
                                                    viewModel.isPasswordFailedNoti1 = true
                                                }
                                            }
                                            .padding(.horizontal, 35)
                                        
                                    } else {
                                        TextField("영문과 숫자를 포함한 최소 8자", text: $viewModel.password)
                                            .focused($focus, equals: .third)
                                            .font(.pretendard(size: 14))
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(focus == .third ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .third ? 1.5 : 1)
                                            }
                                            .onChange(of: viewModel.password) {
                                                viewModel.restorePasswordRelated()
                                                
                                                if viewModel.validatePasswordForm() {
                                                    viewModel.isPasswordFinalValidated = true
                                                } else {
                                                    viewModel.isPasswordFailedNoti1 = true
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
                                    if viewModel.isPasswordFinalValidated {
                                        Text("사용 가능한 비밀번호 입니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.green)
                                        
                                    } else if viewModel.isPasswordFailedNoti1 {
                                        Text("영문과 숫자를 포함하여 8자 이상이어야 합니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.leading, 40)
                            }
                            .padding(.bottom)
                            
                            VStack {
                                HStack {
                                    Text("비밀번호 확인")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                ZStack {
                                    if viewModel.isConfirmPasswordSecured {
                                        SecureField("비밀번호를 한번 더 입력해 주세요", text: $viewModel.confirmPassword)
                                            .focused($focus, equals: .fourth)
                                            .font(.pretendard(size: 14))
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(focus == .fourth ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .fourth ? 1.5 : 1)
                                            }
                                            .onChange(of: viewModel.confirmPassword) {
                                                viewModel.restoreConfirmPasswordRelated()
                                                
                                                if viewModel.validateConfrimPassword() {
                                                    viewModel.isConfirmPasswordFinalValidated = true
                                                    focus = nil
                                                    
                                                } else {
                                                    viewModel.isConfirmPasswordFailedNoti1 = true
                                                }
                                            }
                                            .padding(.horizontal, 35)
                                        
                                    } else {
                                        TextField("비밀번호를 한번 더 입력해 주세요", text: $viewModel.confirmPassword)
                                            .focused($focus, equals: .fourth)
                                            .font(.pretendard(size: 14))
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(focus == .fourth ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .fourth ? 1.5 : 1)
                                            }
                                            .onChange(of: viewModel.confirmPassword) {
                                                viewModel.restoreConfirmPasswordRelated()
                                                
                                                if viewModel.validateConfrimPassword() {
                                                    viewModel.isConfirmPasswordFinalValidated = true
                                                    focus = nil
                                                    
                                                } else {
                                                    viewModel.isConfirmPasswordFailedNoti1 = true
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
                                    if viewModel.isConfirmPasswordFinalValidated {
                                        Text("비밀번호가 일치합니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.green)
                                        
                                    } else if viewModel.isConfirmPasswordFailedNoti1 {
                                        Text("비밀번호가 일치하지 않습니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.leading, 40)
                            }
                        }
                        
                        // MARK: Page 3
                    } else if viewModel.pageIndex == 2 {
                        VStack {
                            Text("잼잼 서비스 이용을 위해\n개인 정보를 입력해 주세요.")
                                .font(.pretendard(Pretendard.extraBold, size: 23))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 25)
                            
                            VStack {
                                HStack {
                                    Text("이름")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                TextField("홍길동", text: $viewModel.realName)
                                    .focused($focus, equals: .first)
                                    .font(.pretendard(size: 14))
                                    .padding(.horizontal)
                                    .frame(height: 50)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(focus == .first ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .first ? 1.5 : 1)
                                    }
                                    .onChange(of: viewModel.realName) {
                                        viewModel.restoreRealNameRelated()
                                        
                                        if viewModel.validateRealNameForm() {
                                            viewModel.isRealNameFinalValidated = true
                                        }
                                    }
                                    .padding(.horizontal, 35)
                                
                                HStack {
                                    if viewModel.isRealNameFailedNoti1 {
                                        Text("한글로 2자 이상으로 입력해주세요.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.leading, 40)
                            }
                            .padding(.bottom)
                            
                            VStack {
                                HStack {
                                    Text("생년월일")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    TextField("년도", text: $viewModel.birthYear)
                                        .focused($focus, equals: .second)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 50)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .second ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .second ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.birthYear) {
                                            viewModel.restoreBirthRelated()
                                            
                                            if viewModel.validateBirthYearForm() {
                                                viewModel.isBirthYearLocalValidated = true
                                            }
                                        }
                                        .onChange(of: viewModel.birthYear) { oldValue, newValue in
                                            if newValue.count > 4 {
                                                viewModel.birthYear = String(newValue.prefix(4))
                                            }
                                        }
                                    
                                    TextField("월", text: $viewModel.birthMonth)
                                        .focused($focus, equals: .third)
                                        .font(.pretendard(size: 14))
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
                                            viewModel.restoreBirthRelated()
                                            
                                            if viewModel.validateBirthMonthForm() {
                                                viewModel.isBirthMonthLocalValidated = true
                                            }
                                        }
                                        .onChange(of: viewModel.birthMonth) { oldValue, newValue in
                                            if newValue.count > 2 {
                                                viewModel.birthMonth = String(newValue.prefix(4))
                                            }
                                        }
                                    
                                    TextField("일", text: $viewModel.birthDay)
                                        .focused($focus, equals: .fourth)
                                        .font(.pretendard(size: 14))
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
                                            viewModel.restoreBirthRelated()
                                            
                                            if viewModel.validateBirthDayForm() {
                                                viewModel.isBirthDayLocalValidated = true
                                            }
                                        }
                                        .onChange(of: viewModel.birthDay) { oldValue, newValue in
                                            if newValue.count > 2 {
                                                viewModel.birthDay = String(newValue.prefix(4))
                                            }
                                        }
                                }
                                .padding(.horizontal, 35)
                                
                                HStack {
                                    if viewModel.isBirthFailedNoti1 {
                                        Text("잘못된 날짜 형식입니다.")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
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
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Button {
                                        withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
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
                                        withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
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
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    TextField("하이픈(-) 제외하고 입력", text: $viewModel.phoneNumber)
                                        .focused($focus, equals: .fifth)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 50)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .fifth ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .fifth ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.phoneNumber) {
                                            viewModel.restorePhoneNumberRelated()
                                        }
                                    
                                    Button {
                                        if viewModel.validatePhoneNumberForm() {
                                            withAnimation(.spring(response: 0.2, dampingFraction: 1.0, blendDuration: 0)) {
                                                viewModel.identifyPhoneNumber()
                                                viewModel.isIdentifiedButtonTapped = true
                                                position.scrollTo(edge: .bottom)
                                            }
                                            
                                        } else {
                                            viewModel.isPhoneNumberFailedNoti1 = true
                                        }
                                    } label: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(maxWidth: 100)
                                            .foregroundStyle(Color.JJTitle)
                                            .overlay {
                                                Text("인증번호 받기")
                                                    .font(.pretendard(Pretendard.semiBold, size: 14))
                                                    .foregroundStyle(.white)
                                            }
                                            .opacity(viewModel.validatePhoneNumberForm() ? 1 : 0.4)
                                    }
                                    .disabled(!viewModel.validatePhoneNumberForm())
                                }
                                .padding(.horizontal, 35)
                                
                                HStack {
                                    if viewModel.isPhoneNumberFailedNoti1 {
                                        Text("하이픈(-)을 제외하고 11자로 입력해주세요")
                                            .font(.pretendard(size: 12))
                                            .foregroundStyle(.red)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.leading, 40)
                            }
                            .padding(.bottom)
                            
                            if viewModel.isIdentifiedButtonTapped {
                                VStack {
                                    HStack {
                                        Text("인증번호")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .padding(.leading, 35)
                                        
                                        Spacer()
                                    }
                                    
                                    TextField("인증번호 6자리를 입력해 주세요", text: $viewModel.identifiedNumber)
                                        .focused($focus, equals: .sixth)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 50)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .sixth ? Color.JJTitle : .gray.opacity(0.5), lineWidth: focus == .sixth ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.identifiedNumber) {
                                            viewModel.restoreIdentifiedNumberRelated()
                                            
                                            if viewModel.identifiedNumber.count == 6 {
                                                if viewModel.checkIdentifyNumber() {
                                                    viewModel.isIdentifiedNumberFinalValidated = true
                                                    focus = nil
                                                    
                                                } else {
                                                    viewModel.isIdentifiedNumberFailedNoti1 = true
                                                }
                                            }
                                        }
                                        .padding(.horizontal, 35)
                                    
                                    HStack {
                                        if viewModel.isIdentifiedNumberFinalValidated {
                                            Text("확인되었습니다.")
                                                .font(.pretendard(size: 12))
                                                .foregroundStyle(.green)
                                        } else if viewModel.isIdentifiedNumberFailedNoti1 {
                                            Text("잘못된 인증번호입니다.")
                                                .font(.pretendard(size: 12))
                                                .foregroundStyle(.red)
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 40)
                                }
                            }
                        }
                    }
                }
            }
            .scrollPosition($position)
            .safeAreaPadding(.bottom, 30)
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0) {
                    Divider()
                    
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
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .foregroundStyle(.white)
                                }
                                .opacity((viewModel.isExpertButtonTappedNoAni || viewModel.isClientButtonTappedNoAni) ? 1 : 0.4)
                                .padding(.horizontal, 35)
                        }
                        .disabled(!(viewModel.isExpertButtonTapped || viewModel.isClientButtonTapped))
                        .padding(.top, 10)
                        
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
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.gray)
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
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.white)
                                    }
                                    .opacity(viewModel.isAllValidatedInPage2 ? 1 : 0.4)
                                    .disabled(!viewModel.isAllValidatedInPage2)
                                    .padding(.trailing, 35)
                            }
                        }
                        .padding(.top, 10)
                        
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
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(.leading, 35)
                            }
                            
                            Button {
                                if viewModel.isAllValidatedInPage3 {
                                    viewModel.completeSignUp()
                                    navRouter.popToRoot()
                                    
                                } else {
                                    if !viewModel.isRealNameFinalValidated {
                                        viewModel.isRealNameFailedNoti1 = true
                                    }
                                    
                                    if !viewModel.isBirthFinalValidated {
                                        viewModel.isBirthFailedNoti1 = true
                                    }
                                }
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 50)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        Text("완료")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.white)
                                    }
                                    .opacity(viewModel.isAllFilledInPage3 ? 1 : 0.4)
                                    .padding(.trailing, 35)
                            }
                            .disabled(!viewModel.isAllFilledInPage3)
                        }
                        .padding(.top, 10)
                    }
                    
                    Spacer()
                }
                .frame(height: 70)
                .background(Color.mainBackground)
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
