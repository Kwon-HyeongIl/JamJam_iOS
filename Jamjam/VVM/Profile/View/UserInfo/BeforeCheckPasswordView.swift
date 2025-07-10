//
//  CheckPasswordView.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import SwiftUI

struct BeforeCheckPasswordView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel: BeforeCheckPasswordViewModel
    
    @FocusState private var focus: TextFieldFocusField?
    
    init(user: UserDomainModel?) {
        viewModel = BeforeCheckPasswordViewModel(user: user)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    Image("check_password_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .padding(.top, 30)
                    
                    Text("정보 수정을 위해\n현재 비밀번호를 입력해 주세요.")
                        .font(.pretendard(size: 16))
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                    
                    ZStack {
                        if viewModel.isCurrentPasswordSecured {
                            SecureField("변경할 비밀번호를 입력해 주세요", text: $viewModel.currentPassword)
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
                                .padding(.horizontal, 20)
                            
                        } else {
                            TextField("변경할 비밀번호를 입력해 주세요", text: $viewModel.currentPassword)
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
                                .padding(.horizontal, 20)
                        }
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                viewModel.isCurrentPasswordSecured.toggle()
                            } label: {
                                Image(systemName: viewModel.isCurrentPasswordSecured ? "eye" : "eye.slash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 40)
                            }
                        }
                    }
                    
                    Button {
                        viewModel.isEntireProgressViewVisible = true
                        viewModel.checkPassword()
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 45)
                            .foregroundStyle(Color.JJTitle)
                            .overlay {
                                Text("비밀번호 확인")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .foregroundStyle(.white)
                            }
                            .padding(.horizontal, 20)
                            .opacity(viewModel.currentPassword.isEmpty ? 0.4 : 1)
                            .disabled(viewModel.currentPassword.isEmpty)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleModifier(title: "비밀번호 확인"))
        .onTapGesture {
            focus = nil
        }
        .alert("비밀번호 확인 실패", isPresented: $viewModel.isCheckPasswordAlertVisible) {
            Button {
                viewModel.checkPasswordAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
            } label: {
                Text("확인")
            }
        } message: {
            Text(viewModel.checkPasswordAlertMessage)
        }
        .toolbarBackground(viewModel.isEntireProgressViewVisible ? .clear : Color.mainBackground, for: .navigationBar)
        .toolbarBackground(viewModel.isEntireProgressViewVisible ? .clear : Color.mainBackground, for: .navigationBar)
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
        .onChange(of: viewModel.isCheckPasswordCompleted) { _, newValue in
            if newValue {
                navRouter.back()
                navRouter.navigate(.editUserInfoView(viewModel.user))
            }
        }
    }
}

#Preview {
    NavigationStack {
        BeforeCheckPasswordView(user: nil)
            .environment(NavigationCore())
    }
}
