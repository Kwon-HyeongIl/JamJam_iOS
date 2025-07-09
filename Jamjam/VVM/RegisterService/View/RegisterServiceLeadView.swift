//
//  WriteView.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import SwiftUI
import Shimmer

struct RegisterServiceLeadView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = RegisterServiceViewModel()
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack {
                    Text("서비스 등록")
                        .font(.pretendard(Pretendard.semiBold, size: 25))
                        .padding(.leading, 20)
                    
                    Spacer()
                }
            }
            .frame(height: 50)
            .background(Color.mainBackground)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    HStack {
                        Text("서비스 소개를 자유롭게 적어주세요!")
                            .font(.pretendard(Pretendard.semiBold, size: 18))
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 5, height: 110)
                            .foregroundStyle(Color.JJTitle)
                            .padding(.leading, 20)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("✨아래 질문을 참고해주시면 더 좋습니다!")
                                .font(.pretendard(Pretendard.regular, size: 14))
                                .foregroundStyle(Color.JJTitle.opacity(0.8))
                                .padding(.bottom, 10)
                            
                            Text("• 어떤 일을 하시나요?")
                                .font(.pretendard(Pretendard.regular, size: 14))
                                .foregroundStyle(.gray.opacity(0.8))
                            
                            Text("• 어떤 도움이 필요한 사람에게 이 서비스를 추천하시나요?")
                                .font(.pretendard(Pretendard.regular, size: 14))
                                .foregroundStyle(.gray.opacity(0.8))
                            
                            Text("• 비슷한 일을 해보신 경험이 있다면 알려주세요!")
                                .font(.pretendard(Pretendard.regular, size: 14))
                                .foregroundStyle(.gray.opacity(0.8))
                        }
                        
                        Spacer()
                    }
                    
                    TextField("서비스 소개를 입력해 주세요.", text: $viewModel.initialDescription, axis: .vertical)
                        .focused($focus, equals: .first)
                        .font(.pretendard(size: 15))
                        .lineLimit(1...15)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .frame(minHeight: 200)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(focus == .first ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .first ? 1.5 : 1)
                        }
                        .overlay {
                            VStack {
                                Spacer()
                                
                                HStack {
                                    Spacer()
                                    
                                    Text("\(viewModel.initialDescription.count)/500자")
                                        .font(.pretendard(Pretendard.regular, size: 10))
                                        .foregroundStyle(.gray.opacity(0.5))
                                        .padding(.trailing, 10)
                                        .padding(.bottom, 10)
                                }
                            }
                        }
                        .onChange(of: viewModel.initialDescription) { _, newValue in
                            if newValue.count > 500 {
                                viewModel.initialDescription = String(newValue.prefix(500))
                            }
                        }
                        .padding(.horizontal, 20)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            viewModel.isAiGenerateContentsProgressViewVisible = true
                            viewModel.generateService()
                        } label: {
                            Image("ai_generate_button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130)
                                .scaleEffect(1.2)
                                .padding(.trailing, 7)
                                .shimmering(active: viewModel.isAiGenerateContentsProgressViewVisible)
                                .opacity(viewModel.initialDescription.isEmpty ? 0.4 : 1)
                        }
                        .disabled(viewModel.initialDescription.isEmpty)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .overlay {
            if viewModel.isAiGenerateContentsProgressViewVisible {
                VStack {
                    VStack(spacing: 15) {
                        ProgressView()
                            .scaleEffect(1.5)
                            .tint(Color.JJTitle)
                        
                        Text("AI가 콘텐츠를 생성하고 있습니다.")
                            .font(.pretendard(Pretendard.semiBold, size: 16))
                            .foregroundStyle(.white)
                    }
                    .padding(.bottom, 30)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.gray.opacity(0.5))
            }
        }
        .onChange(of: viewModel.isInitialContentsGenerateCompleted) { _, newValue in
            if newValue {
                navRouter.navigate(.registerServiceTailView(viewModel))
            }
        }
        .onTapGesture {
            focus = nil
        }
    }
}

#Preview {
    RegisterServiceLeadView()
        .environment(NavigationCore())
}
