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
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 5) {
                                ForEach(Array(viewModel.aiRecommendServiceNames.enumerated()), id: \.element) { index, serviceName in
                                    HStack(spacing: 10) {
                                        Text(serviceName)
                                            .font(.pretendard(size: 15))
                                    }
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 6)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(.white)
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
                        
                        WebView(markdown: $viewModel.discription)
                            .frame(height: 400)
                            .padding(.horizontal, 20)
                    }
                }
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
