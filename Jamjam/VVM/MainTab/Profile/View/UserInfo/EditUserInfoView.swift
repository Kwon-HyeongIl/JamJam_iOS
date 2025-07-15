//
//  EditUserInfoView.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import SwiftUI

struct EditUserInfoView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = EditUserInfoViewModel()
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 30) {
                    VStack(spacing: 10) {
                        VStack {
                            if let image = viewModel.newProfileImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80)
                                    .clipShape(Circle())
                                    .padding(.leading, 20)
                                
                            } else {
                                AsyncImage(url: URL(string: viewModel.existedProfileImageUrl)) { state in
                                    switch state {
                                    case .empty:
                                        Circle()
                                            .scaledToFit()
                                            .frame(width: 80)
                                            .foregroundStyle(.gray.opacity(0.5))
                                            .overlay {
                                                Image(systemName: "plus")
                                                    .font(.system(size: 20))
                                                    .foregroundStyle(.white)
                                            }
                                            .padding(.leading, 20)
                                        
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80)
                                            .clipShape(Circle())
                                            .padding(.leading, 20)
                                        
                                    case .failure:
                                        Circle()
                                            .scaledToFit()
                                            .frame(width: 80)
                                            .foregroundStyle(.gray.opacity(0.5))
                                            .overlay {
                                                Image(systemName: "plus")
                                                    .font(.system(size: 20))
                                                    .foregroundStyle(.white)
                                            }
                                            .padding(.leading, 20)
                                        
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            }
                        }
                        .photosPicker(
                            isPresented: $viewModel.isNewProfileImagePhotosPickerVisible,
                            selection: $viewModel.selectedNewProfileImage,
                            matching: .images
                        )
                        .onTapGesture {
                            viewModel.isNewProfileImagePhotosPickerVisible = true
                        }
                        .padding(.top)
                        
                        if !(viewModel.user?.profileUrl ?? "").isEmpty || viewModel.newProfileImage == nil {
                            Text("프로필 추가")
                                .font(.pretendard(Pretendard.medium, size: 15))
                                .padding(.leading, 20)
                            
                        } else {
                            Button {
                                viewModel.existedProfileImageUrl = ""
                                viewModel.newProfileImage = nil
                                viewModel.isProfileImageDeleted = true
                            } label: {
                                Text("프로필 삭제")
                                    .font(.pretendard(Pretendard.medium, size: 15))
                                    .padding(.leading, 20)
                            }
                        }
                    }
                    
                    // MARK: 닉네임
                    VStack {
                        HStack {
                            Text("닉네임")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        HStack {
                            TextField("2자 이상 입력해주세요", text: $viewModel.nickname)
                                .focused($focus, equals: .first)
                                .font(.pretendard(size: 14))
                                .padding(.horizontal)
                                .frame(height: 45)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(focus == .first ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .first ? 1.5 : 1)
                                }
                                .onChange(of: viewModel.nickname) {
                                    viewModel.restoreNicknameRelated()
                                    
                                    if viewModel.nickname.count == 1 {
                                        viewModel.isNicknameNotiVisible = true
                                        viewModel.nicknameNotiMessage = "10자 이내의 한글, 영문, 숫자 조합으로 입력해주세요."
                                    }
                                }
                            
                            Button {
                                viewModel.isProgressViewVisibleInNickname = true
                                
                                if viewModel.validateNicknameForm() {
                                    viewModel.checkNicknameIsDuplicated()
                                    
                                } else {
                                    viewModel.isNicknameNotiVisible = true
                                    viewModel.nicknameNotiMessage = "10자 이내의 한글, 영문, 숫자 조합으로 입력해주세요."
                                }
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(maxWidth: 80)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        VStack(spacing: 0) {
                                            Text("중복 확인")
                                                .font(.pretendard(Pretendard.semiBold, size: 14))
                                                .foregroundStyle(.white)
                                            
                                            if viewModel.isProgressViewVisibleInNickname {
                                                ProgressView()
                                                    .scaleEffect(0.8)
                                                    .tint(Color.JJTitle)
                                            }
                                        }
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
                        .padding(.horizontal, 20)
                        
                        HStack {
                            if viewModel.isNicknameNotiVisible {
                                Text(viewModel.nicknameNotiMessage)
                                    .font(.pretendard(size: 12))
                                    .foregroundStyle(viewModel.isNicknameFinalValidated ? .green : .red)
                                    .padding(.leading, 25)
                            }
                            
                            Spacer()
                        }
                        .padding(.bottom, 3)
                        
                        VStack(spacing: 3) {
                            HStack {
                                Text("*닉네임은 최초 설정 또는 변경 후 30일이 지나야 바꿀 수 있어요.")
                                    .font(.pretendard(size: 10))
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 25)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text("*진행 중인 거래가 있으면 닉네임을 바꿀 수 없어요.")
                                    .font(.pretendard(size: 10))
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 25)
                                
                                Spacer()
                            }
                        }
                    }
                    
                    // MARK: 휴대폰 번호
                    VStack {
                        HStack {
                            Text("휴대폰 번호")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        HStack {
                            TextField("하이픈(-) 제외하고 입력", text: $viewModel.phoneNumber)
                                .focused($focus, equals: .second)
                                .font(.pretendard(size: 14))
                                .padding(.horizontal)
                                .frame(height: 45)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(focus == .second ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .second ? 1.5 : 1)
                                }
                                .onChange(of: viewModel.phoneNumber) {
                                    viewModel.restorePhoneNumberRelated()
                                }
                            
                            Button {
                                viewModel.isProgressViewVisibleInPhoneNumber = true
                                
                                if viewModel.validatePhoneNumberForm() {
                                    viewModel.sendPhoneNumber()
                                    
                                    withAnimation(.customAnimation) {
                                        viewModel.isPhoneNumberSendingButtonTapped = true
                                    }
                                    
                                } else {
                                    viewModel.isPhoneNumberNotiVisible = true
                                    viewModel.phoneNumberNotiMessage = "하이픈(-)을 제외하고 11자로 입력해주세요"
                                }
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(maxWidth: 100)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        VStack(spacing: 0) {
                                            Text("인증번호 받기")
                                                .font(.pretendard(Pretendard.semiBold, size: 14))
                                                .foregroundStyle(.white)
                                            
                                            if viewModel.isProgressViewVisibleInPhoneNumber {
                                                ProgressView()
                                                    .scaleEffect(0.8)
                                                    .tint(Color.JJTitle)
                                            }
                                        }
                                    }
                                    .opacity(viewModel.validatePhoneNumberForm() ? 1 : 0.4)
                            }
                            .disabled(!viewModel.validatePhoneNumberForm())
                        }
                        .padding(.horizontal, 20)
                        
                        HStack {
                            if viewModel.isPhoneNumberNotiVisible {
                                Text(viewModel.phoneNumberNotiMessage)
                                    .font(.pretendard(size: 12))
                                    .foregroundStyle(viewModel.isPhoneNumberFinalValidated ? .green : .red)
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 25)
                    }
                    
                    // MARK: 인증번호
                    if viewModel.isPhoneNumberSendingButtonTapped {
                        VStack {
                            HStack {
                                Text("인증번호")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            TextField("인증번호 6자리를 입력해 주세요", text: $viewModel.phoneCode)
                                .focused($focus, equals: .third)
                                .font(.pretendard(size: 14))
                                .padding(.horizontal)
                                .frame(height: 45)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(focus == .third ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .third ? 1.5 : 1)
                                }
                                .onChange(of: viewModel.phoneCode) {
                                    viewModel.restoreIdentifiedNumberRelated()
                                    
                                    if viewModel.phoneCode.count == 6 {
                                        viewModel.verifyPhoneIdentifiedNumber()
                                    }
                                }
                                .onChange(of: viewModel.phoneCode) { _, newValue in
                                    if newValue.count > 6 {
                                        viewModel.phoneCode = String(newValue.prefix(6))
                                    }
                                }
                                .padding(.horizontal, 20)
                            
                            HStack {
                                if viewModel.isPhoneCodeNotiVisible {
                                    Text(viewModel.phoneCodeNotiMessage)
                                        .font(.pretendard(size: 12))
                                        .foregroundStyle(viewModel.isPhoneCodeFinalValidated ? .green : .red)
                                }
                                
                                Spacer()
                            }
                            .padding(.leading, 25)
                        }
                    }
                    
                    // MARK: 비밀번호
                    VStack {
                        VStack {
                            HStack {
                                Text("비밀번호")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            ZStack {
                                if viewModel.isNewPasswordSecured {
                                    SecureField("변경할 비밀번호를 입력해 주세요", text: $viewModel.newPassword)
                                        .focused($focus, equals: .fourth)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 45)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .fourth ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .fourth ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.newPassword) {
                                            viewModel.restoreNewPasswordRelated()
                                            
                                            if viewModel.validateNewPasswordForm() {
                                                viewModel.isNewPasswordFinalValidated = true
                                                viewModel.isNewPasswordNotiVisible = true
                                                viewModel.newPasswordNotiMessage = "사용 가능한 비밀번호 입니다."
                                                
                                            } else {
                                                viewModel.isNewPasswordNotiVisible = true
                                                viewModel.newPasswordNotiMessage = "영문과 숫자를 포함하여 8자 이상이어야 합니다."
                                            }
                                        }
                                        .padding(.horizontal, 20)
                                    
                                } else {
                                    TextField("변경할 비밀번호를 입력해 주세요", text: $viewModel.newPassword)
                                        .focused($focus, equals: .fourth)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 45)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .fourth ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .fourth ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.newPassword) {
                                            viewModel.restoreNewPasswordRelated()
                                            
                                            if viewModel.validateNewPasswordForm() {
                                                viewModel.isNewPasswordFinalValidated = true
                                                viewModel.isNewPasswordNotiVisible = true
                                                viewModel.newPasswordNotiMessage = "사용 가능한 비밀번호 입니다."
                                                
                                            } else {
                                                viewModel.isNewPasswordNotiVisible = true
                                                viewModel.newPasswordNotiMessage = "영문과 숫자를 포함하여 8자 이상이어야 합니다."
                                                
                                            }
                                        }
                                        .padding(.horizontal, 20)
                                }
                                
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        viewModel.isNewPasswordSecured.toggle()
                                    } label: {
                                        Image(systemName: viewModel.isNewPasswordSecured ? "eye" : "eye.slash")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20)
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 40)
                                    }
                                }
                            }
                            
                            HStack {
                                if viewModel.isNewPasswordNotiVisible {
                                    Text(viewModel.newPasswordNotiMessage)
                                        .font(.pretendard(size: 12))
                                        .foregroundStyle(viewModel.isNewPasswordFinalValidated ? .green : .red)
                                }
                                
                                Spacer()
                            }
                            .padding(.leading, 25)
                        }
                        
                        // MARK: 비밀번호 확인
                        VStack {
                            HStack {
                                Text("비밀번호 확인")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            ZStack {
                                if viewModel.isNewConfirmPasswordSecured {
                                    SecureField("변경할 비밀번호를 한번 더 입력해 주세요", text: $viewModel.newConfirmPassword)
                                        .focused($focus, equals: .fifth)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 45)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .fifth ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .fifth ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.newConfirmPassword) {
                                            viewModel.restoreNewConfirmPasswordRelated()
                                            
                                            if viewModel.validateNewConfrimPassword() {
                                                viewModel.isNewConfirmPasswordFinalValidated = true
                                                viewModel.isNewConfirmPasswordNotiVisible = true
                                                viewModel.newConfirmPasswordNotiMessage = "비밀번호가 일치합니다."
                                                focus = nil
                                                
                                            } else {
                                                viewModel.isNewConfirmPasswordNotiVisible = true
                                                viewModel.newConfirmPasswordNotiMessage = "비밀번호가 일치하지 않습니다."
                                            }
                                        }
                                        .padding(.horizontal, 20)
                                    
                                } else {
                                    TextField("변경할 비밀번호를 한번 더 입력해 주세요", text: $viewModel.newConfirmPassword)
                                        .focused($focus, equals: .fifth)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 45)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .fifth ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .fifth ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.newConfirmPassword) {
                                            viewModel.restoreNewConfirmPasswordRelated()
                                            
                                            if viewModel.validateNewConfrimPassword() {
                                                viewModel.isNewConfirmPasswordFinalValidated = true
                                                viewModel.isNewConfirmPasswordNotiVisible = true
                                                viewModel.newConfirmPasswordNotiMessage = "비밀번호가 일치합니다."
                                                focus = nil
                                                
                                            } else {
                                                viewModel.isNewConfirmPasswordNotiVisible = true
                                                viewModel.newConfirmPasswordNotiMessage = "비밀번호가 일치하지 않습니다."
                                            }
                                        }
                                        .padding(.horizontal, 20)
                                }
                                
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        viewModel.isNewConfirmPasswordSecured.toggle()
                                    } label: {
                                        Image(systemName: viewModel.isNewConfirmPasswordSecured ? "eye" : "eye.slash")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20)
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 40)
                                    }
                                }
                            }
                            
                            HStack {
                                if viewModel.isNewConfirmPasswordNotiVisible {
                                    Text(viewModel.newConfirmPasswordNotiMessage)
                                        .font(.pretendard(size: 12))
                                        .foregroundStyle(viewModel.isNewConfirmPasswordFinalValidated ? .green : .red)
                                }
                                
                                Spacer()
                            }
                            .padding(.leading, 25)
                        }
                    }
                    
                    // MARK: 환불 계좌 정보
                    VStack {
                        HStack {
                            Text("환불 계좌 정보")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        Menu {
                            Button {
                                viewModel.bankType = .bankOfKorea
                            } label: {
                                Text(Bank.bankOfKorea.text)
                            }
                            
                            Button {
                                viewModel.bankType = .koreaDevelopmentBank
                            } label: {
                                Text(Bank.koreaDevelopmentBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .industrialBankOfKorea
                            } label: {
                                Text(Bank.industrialBankOfKorea.text)
                            }
                            
                            Button {
                                viewModel.bankType = .kbKookminBank
                            } label: {
                                Text(Bank.kbKookminBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .suhyupBank
                            } label: {
                                Text(Bank.suhyupBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .exportImportBank
                            } label: {
                                Text(Bank.exportImportBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .nonghyupBank
                            } label: {
                                Text(Bank.nonghyupBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .scJeilBank
                            } label: {
                                Text(Bank.scJeilBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .citibankKorea
                            } label: {
                                Text(Bank.citibankKorea.text)
                            }
                            
                            Button {
                                viewModel.bankType = .daeguBank
                            } label: {
                                Text(Bank.daeguBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .busanBank
                            } label: {
                                Text(Bank.busanBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .gwangjuBank
                            } label: {
                                Text(Bank.gwangjuBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .jejuBank
                            } label: {
                                Text(Bank.jejuBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .jeonbukBank
                            } label: {
                                Text(Bank.jeonbukBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .gyeongnamBank
                            } label: {
                                Text(Bank.gyeongnamBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .postOffice
                            } label: {
                                Text(Bank.postOffice.text)
                            }
                            
                            Button {
                                viewModel.bankType = .hanaBank
                            } label: {
                                Text(Bank.hanaBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .shinhanBank
                            } label: {
                                Text(Bank.shinhanBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .kBank
                            } label: {
                                Text(Bank.kBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .kakaoBank
                            } label: {
                                Text(Bank.kakaoBank.text)
                            }
                            
                            Button {
                                viewModel.bankType = .tossBank
                            } label: {
                                Text(Bank.tossBank.text)
                            }
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 20)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        .padding(.horizontal, 20)
                                }
                                .overlay {
                                    HStack {
                                        Text(viewModel.bankType?.text ?? "은행을 선택해 주세요")
                                            .font(.pretendard(size: 14))
                                            .foregroundStyle(viewModel.bankType == nil ? .gray.opacity(0.55) : .black)
                                            .padding(.leading, 35)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .font(.system(size: 14.5))
                                            .foregroundStyle(.gray.opacity(0.55))
                                            .padding(.trailing, 35)
                                    }
                                }
                        }
                        .padding(.bottom)
                        
                        HStack {
                            Text(viewModel.user?.name ?? "")
                                .font(.pretendard(size: 14))
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(.gray.opacity(0.2))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 20)
                        
                        TextField("계좌 번호를 입력해 주세요", text: $viewModel.bankAccount)
                            .focused($focus, equals: .sixth)
                            .font(.pretendard(size: 14))
                            .padding(.horizontal)
                            .frame(height: 45)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(focus == .sixth ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .sixth ? 1.5 : 1)
                            }
                            .onChange(of: viewModel.phoneCode) {
                                viewModel.restoreBankAccountRelated()
                            }
                            .padding(.horizontal, 20)
                        
                        HStack {
                            if viewModel.isBankAccountNotiVisible {
                                Text(viewModel.bankAccountNotiMessage)
                                    .font(.pretendard(size: 12))
                                    .foregroundStyle(viewModel.isBankAccountFinalValidated ? .green : .red)
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 25)
                    }
                }
            }
            .padding(.top, 1)
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0) {
                    Divider()
                    
                    Spacer()
                    
                    Button {
                        viewModel.isEntireProgressViewVisible = true
                        viewModel.updateUserInfo()
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 45)
                            .foregroundStyle(Color.JJTitle)
                            .overlay {
                                Text("등록")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .foregroundStyle(.white)
                            }
                            .padding(.horizontal, 20)
                            .opacity(viewModel.isAllValidated ? 1 : 0.4)
                            .disabled(!viewModel.isAllValidated)
                    }
                    
                    Spacer()
                }
                .frame(height: 70)
                .background(Color.mainBackground)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleModifier(title: "기본 정보 수정", isEntireProgressVisible: $viewModel.isEntireProgressViewVisible))
        .onTapGesture {
            focus = nil
        }
        .onChange(of: viewModel.isUpdateCompleted) {
            navRouter.back()
        }
        .blur(radius: viewModel.isEntireProgressViewVisible ? 2.0 : 0)
        .overlay {
            if viewModel.isEntireProgressViewVisible {
                VStack {
                    ProgressView()
                        .scaleEffect(1.5)
                        .tint(Color.JJTitle)
                        .padding(.bottom, 30)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.gray.opacity(0.5))
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditUserInfoView()
            .environment(NavigationCore())
    }
}
