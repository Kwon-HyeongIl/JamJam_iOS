//
//  WriteServiceTailView.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import SwiftUI
import Shimmer

struct RegisterServiceTailView: View {
    @Environment(NavigationCore.self) var navRouter
    @Bindable var viewModel: RegisterServiceViewModel
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                switch viewModel.pageIndex {
                case 1:
                    VStack(spacing: 30) {
                        VStack {
                            HStack {
                                Text("지역")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            .padding(.top)
                            
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
                    
                case 2:
                    VStack(spacing: 30) {
                        VStack {
                            HStack {
                                Text("썸네일 사진")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            .padding(.top)
                            .padding(.bottom, 10)
                            
                            HStack {
                                Image(systemName: "info.circle")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.gray.opacity(0.5))
                                    .padding(.leading, 20)
                                
                                Text("AI가 생성한 썸네일에서 서비스 명이 잘못 표기될 수 있습니다.")
                                    .font(.pretendard(Pretendard.regular, size: 12))
                                    .foregroundStyle(.gray.opacity(0.5))
                                
                                Spacer()
                            }
                            .padding(.bottom, 5)
                            
                            HStack {
                                Image("ai_sample_correct")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 140)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.leading, 20)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Spacer()
                                                
                                                HStack {
                                                    Text("정상")
                                                        .font(.pretendard(Pretendard.regular, size: 12))
                                                        .foregroundStyle(.white)
                                                }
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 4)
                                                .background {
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .foregroundStyle(.green)
                                                }
                                                .padding(.trailing, 8)
                                            }
                                            .padding(.top, 8)
                                            
                                            Spacer()
                                        }
                                    }
                                
                                Image("ai_sample_wrong")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 140)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Spacer()
                                                
                                                HStack {
                                                    Text("오류")
                                                        .font(.pretendard(Pretendard.regular, size: 12))
                                                        .foregroundStyle(.white)
                                                }
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 4)
                                                .background {
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .foregroundStyle(.red)
                                                }
                                                .padding(.trailing, 8)
                                            }
                                            .padding(.top, 8)
                                            
                                            Spacer()
                                        }
                                    }
                                
                                Spacer()
                            }
                            .padding(.bottom)
                            
                            if let thumbnailImage = viewModel.thumbnailImage {
                                Image(uiImage: thumbnailImage)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 20)
                                    .overlay {
                                        VStack {
                                            HStack {
                                                Spacer()
                                                
                                                Image(systemName: "xmark.circle.fill")
                                                    .font(.system(size: 10))
                                                    .foregroundStyle(.gray.opacity(0.5))
                                                    .padding(.trailing, 7)

                                            }
                                            .padding(.top, 7)
                                            
                                            Spacer()
                                        }
                                    }
                                
                            } else {
                                RoundedRectangle(cornerRadius: 10)
                                    .scaledToFit()
                                    .foregroundStyle(viewModel.isAiGenerateImageProgressViewVisible ? .gray.opacity(0.5) : .gray.opacity(0.1))
                                    .padding(.horizontal, 20)
                                    .overlay {
                                        if !viewModel.isAiGenerateImageProgressViewVisible {
                                            VStack(spacing: 10) {
                                                Image(systemName: "photo")
                                                    .font(.system(size: 35))
                                                    .foregroundStyle(.gray.opacity(0.7))
                                                
                                                Text("사진 업로드")
                                                    .font(.pretendard(Pretendard.regular, size: 16))
                                                    .foregroundStyle(.gray.opacity(0.7))
                                            }
                                            
                                        } else {
                                            VStack {
                                                VStack(spacing: 15) {
                                                    ProgressView()
                                                        .scaleEffect(1.5)
                                                        .tint(Color.JJTitle)
                                                    
                                                    Text("AI 썸네일 생성 중")
                                                        .font(.pretendard(Pretendard.regular, size: 16))
                                                        .foregroundStyle(.white)
                                                }
                                            }
                                        }
                                    }
                            }
                            
                            HStack {
                                HStack {
                                    Image(systemName: viewModel.typography ? "checkmark.square.fill" : "checkmark.square")
                                        .font(.system(size: 18))
                                        .foregroundStyle(viewModel.typography ? Color.JJTitle : .gray.opacity(0.5))
                                        .onTapGesture {
                                            viewModel.typography.toggle()
                                        }
                                    
                                    Text("썸네일에 서비스 명 표기")
                                        .font(.pretendard(Pretendard.regular, size: 15))
                                }
                                .padding(.leading, 20)
                                .padding(.bottom, 20)
                                
                                Spacer()
                                
                                Button {
                                    viewModel.isAiGenerateImageProgressViewVisible = true
                                } label: {
                                    Image("ai_generate_button")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 130)
                                        .scaleEffect(1.2)
                                        .padding(.top, 10)
                                        .padding(.trailing, 7)
                                        .shimmering(active: viewModel.isAiGenerateImageProgressViewVisible)
                                }
                            }
                            
                        }
                        
                        VStack {
                            HStack {
                                Text("썸네일 사진")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 150)
                                .foregroundStyle(.gray.opacity(0.1))
                                .padding(.horizontal, 20)
                                .overlay {
                                    VStack(spacing: 10) {
                                        Image(systemName: "photo")
                                            .font(.system(size: 35))
                                            .foregroundStyle(.gray.opacity(0.7))
                                        
                                        Text("탭하여 사진 불러오기")
                                            .font(.pretendard(Pretendard.regular, size: 16))
                                            .foregroundStyle(.gray.opacity(0.7))
                                    }
                                }
                                .padding(.bottom, 12)
                        }
                    }
                    
                default:
                    VStack {}
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0) {
                    Divider()
                    
                    Spacer()
                    
                    switch viewModel.pageIndex {
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
                                    .opacity(viewModel.isAllValidatedInPageIndex2 ? 1 : 0.4)
                                    .disabled(!viewModel.isAllValidatedInPageIndex2)
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
