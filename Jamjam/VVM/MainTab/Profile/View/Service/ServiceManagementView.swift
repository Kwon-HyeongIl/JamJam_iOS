//
//  ServiceManagementView.swift
//  Jamjam
//
//  Created by 권형일 on 7/15/25.
//

import SwiftUI

struct ServiceManagementView: View {
    @State private var viewModel = ServiceManagementViewModel()
    
    @Namespace private var tabListUnderline
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(Array(viewModel.segmentedControlList.enumerated()), id: \.offset) { idx, title in
                        VStack(spacing: 5) {
                            HStack(spacing: 5) {
                                Text(title)
                                    .font(.pretendard(Pretendard.medium, size: 16))
                                    .fontWeight(idx == viewModel.segmentedControlIndex ? .semibold : .medium)
                                    .foregroundStyle(idx == viewModel.segmentedControlIndex ? .black : .gray)
                                    .animation(nil, value: viewModel.segmentedControlIndex)
                                
                                if idx == 1 {
                                    if viewModel.servicePreparingCount > 0 {
                                        HStack {
                                            Text("\(viewModel.servicePreparingCount)")
                                                .font(.pretendard(size: 12))
                                                .foregroundStyle(.white)
                                        }
                                        .padding(5)
                                        .background(Color.JJTitle)
                                        .clipShape(Circle())
                                    }
                                    
                                } else if idx == 2 {
                                    if viewModel.serviceCompletedCount > 0 {
                                        HStack {
                                            Text("\(viewModel.serviceCompletedCount)")
                                                .font(.pretendard(size: 12))
                                                .foregroundStyle(.white)
                                        }
                                        .padding(5)
                                        .background(Color.JJTitle)
                                        .clipShape(Circle())
                                    }
                                    
                                } else if idx == 3 {
                                    if viewModel.serviceCancelledCount > 0 {
                                        HStack {
                                            Text("\(viewModel.serviceCancelledCount)")
                                                .font(.pretendard(size: 12))
                                                .foregroundStyle(.white)
                                        }
                                        .padding(5)
                                        .background(Color.JJTitle)
                                        .clipShape(Circle())
                                    }
                                }
                            }
                            .padding(.leading, idx == 0 ? 20 : 0)
                            
                            if idx == viewModel.segmentedControlIndex {
                                Rectangle()
                                    .fill(Color.JJTitle)
                                    .frame(height: 2)
                                    .padding(.horizontal, -5)
                                    .matchedGeometryEffect(id: "underline", in: tabListUnderline)
                                    .padding(.leading, idx == 0 ? 20 : 0)
                            } else {
                                Color.clear.frame(height: 2)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.customAnimation) {
                                viewModel.segmentedControlIndex = idx
                            }
                        }
                    }
                }
            }
            
            ScrollView(showsIndicators: false) {
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleAndHomeModifier(title: "서비스 관리"))
    }
}

#Preview {
    NavigationStack {
        ServiceManagementView()
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
