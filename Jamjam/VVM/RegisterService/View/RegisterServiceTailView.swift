//
//  WriteServiceTailView.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import SwiftUI

struct RegisterServiceTailView: View {
    @Environment(NavigationCore.self) var navRouter
    @Bindable var viewModel: RegisterServiceViewModel
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    VStack {
                        HStack {
                            Text("지역")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        TextField("서비스 명을 입력해 주세요", text: $viewModel.serviceName)
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
                            .padding(.bottom, 5)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 5) {
                                ForEach(Array(viewModel.aiRecommendServiceNames.enumerated()), id: \.element) { index, serviceName in
                                    HStack(spacing: 10) {
                                        Text(serviceName)
                                            .font(.pretendard(size: 14))
                                            .foregroundStyle(viewModel.serviceName == serviceName ? Color.JJTitle : .black)
                                    }
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 6)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(viewModel.serviceName == serviceName ? .red.opacity(0.1) : .white)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .strokeBorder(viewModel.serviceName == serviceName ? Color.JJTitle : .gray.opacity(0.2), lineWidth: 1)
                                            }
                                    )
                                    .fixedSize()
                                    .padding(.leading, index == 0 ? 20 : 0)
                                    .onTapGesture {
                                        withAnimation(.customAnimation) {
                                            viewModel.serviceName = serviceName
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top)
                    
                    VStack {
                        HStack {
                            Text("서비스 상세 설명")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        WebView(markdown: $viewModel.description)
                            .frame(height: 400)
                            .padding(.horizontal, 20)
                    }
                    
                    VStack {
                        HStack {
                            Text("카테고리")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        Menu {
                            Button {
                                viewModel.category = .management
                            } label: {
                                Text(Skill.management.text)
                            }
                            
                            Button {
                                viewModel.category = .consulting
                            } label: {
                                Text(Skill.consulting.text)
                            }
                            
                            Button {
                                viewModel.category = .marketing
                            } label: {
                                Text(Skill.marketing.text)
                            }
                            
                            Button {
                                viewModel.category = .development
                            } label: {
                                Text(Skill.development.text)
                            }
                            
                            Button {
                                viewModel.category = .design
                            } label: {
                                Text(Skill.design.text)
                            }
                            
                            Button {
                                viewModel.category = .writing
                            } label: {
                                Text(Skill.writing.text)
                            }
                            
                            Button {
                                viewModel.category = .translation
                            } label: {
                                Text(Skill.translation.text)
                            }
                            
                            Button {
                                viewModel.category = .media
                            } label: {
                                Text(Skill.media.text)
                            }
                            
                            Button {
                                viewModel.category = .education
                            } label: {
                                Text(Skill.education.text)
                            }
                            
                            Button {
                                viewModel.category = .customMade
                            } label: {
                                Text(Skill.customMade.text)
                            }
                            
                            Button {
                                viewModel.category = .hobbyLesson
                            } label: {
                                Text(Skill.hobbyLesson.text)
                            }
                            
                            Button {
                                viewModel.category = .lifeService
                            } label: {
                                Text(Skill.lifeService.text)
                            }
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 50)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 20)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray.opacity(0.2), lineWidth: 1)
                                        .padding(.horizontal, 20)
                                }
                                .overlay {
                                    HStack {
                                        Text(viewModel.category?.text ?? "")
                                            .font(.pretendard(size: 14))
                                            .foregroundStyle(.black)
                                            .padding(.leading, 35)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .font(.system(size: 14.5))
                                            .foregroundStyle(.gray.opacity(0.55))
                                            .padding(.trailing, 35)
                                    }
                                }
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("가격")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .padding(.leading, 20)
                            
                            Text("(VAT 포함가)")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                                .foregroundStyle(.gray.opacity(0.5))
                            
                            Spacer()
                        }
                        
                        TextField("가격을 입력해 주세요", text: $viewModel.price)
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
                            .padding(.bottom, 5)
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0) {
                    Divider()
                    
                    Spacer()
                    
                    switch viewModel.pageIndex {
                    case 0:
                        VStack {}
                    case 1:
                        HStack(spacing: 15) {
                            Button {
                                viewModel.pageIndex = 0
                                navRouter.back()
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(.white)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                    }
                                    .overlay {
                                        Text("이전")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(.leading, 20)
                            }
                            
                            Button {
                                viewModel.pageIndex = 2
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        Text("다음")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.trailing, 20)
                                    .opacity(viewModel.isAllValidatedInPageIndex1 ? 1 : 0.4)
                                    .disabled(!viewModel.isAllValidatedInPageIndex1)
                            }
                        }
                        
                    case 2:
                        HStack(spacing: 15) {
                            Button {
                                viewModel.pageIndex = 1
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(.white)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                    }
                                    .overlay {
                                        Text("이전")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(.leading, 20)
                            }
                            
                            Button {
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        Text("등록")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.trailing, 20)
//                                    .opacity(viewModel.isAllValidatedInPageIndex1 ? 1 : 0.4)
//                                    .disabled(!viewModel.isAllValidatedInPageIndex1)
                            }
                        }

                    default:
                        VStack {}
                    }
                    
                    Spacer()
                }
                .frame(height: 70)
                .background(Color.mainBackground)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarTitleAndHomeModifier(title: "서비스 등록"))
        .onTapGesture {
            focus = nil
        }
    }
}

#Preview {
    NavigationStack {
        RegisterServiceTailView(viewModel: RegisterServiceViewModel())
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
