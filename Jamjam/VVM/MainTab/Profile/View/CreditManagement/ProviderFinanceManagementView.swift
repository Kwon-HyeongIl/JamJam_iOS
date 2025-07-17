//
//  ProviderFinanceManagementView.swift
//  Jamjam
//
//  Created by 권형일 on 7/15/25.
//

import SwiftUI

struct CreditManagementView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = ProviderFinanceManagementViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    VStack(spacing: 20) {
                        VStack(spacing: 10) {
                            Text("총 수익금")
                                .font(.pretendard(Pretendard.semiBold, size: 18))
                            
                            Text("10000원")
                                .font(.pretendard(Pretendard.semiBold, size: 20))
                        }
                        
                        HStack(spacing: 40) {
                            VStack(spacing: 10) {
                                Text("출금 가능 수익금")
                                    .font(.pretendard(size: 15))
                                    .foregroundStyle(.gray)
                                
                                Text("1000원")
                                    .font(.pretendard(size: 15))
                            }
                            
                            Divider()
                                .frame(height: 60)
                            
                            VStack(spacing: 10) {
                                Text("정산 예정 수익금")
                                    .font(.pretendard(size: 15))
                                    .foregroundStyle(.gray)
                                
                                Text("1000원")
                                    .font(.pretendard(size: 15))
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom)
                    
                    HStack {
                        Text("• 크레딧 충전은 잼잼의 공식 홈페이지를 통해 진행할 수 있습니다.")
                            .font(.pretendard(size: 12))
                            .foregroundStyle(.gray)
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                }
            }
            .padding(.top, 1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleAndHomeModifier(title: "수익 관리"))
    }
}

#Preview {
    NavigationStack {
        CreditManagementView()
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
