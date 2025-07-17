//
//  ClientFinanceManagementView.swift
//  Jamjam
//
//  Created by 권형일 on 7/16/25.
//

import SwiftUI

struct ClientFinanceManagementView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = ClientFinanceManagementViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    HStack(spacing: 40) {
                        VStack(spacing: 15) {
                            Text("보유중인 크레딧")
                                .font(.pretendard(Pretendard.semiBold, size: 18))
                            
                            Text("10000원")
                                .font(.pretendard(Pretendard.semiBold, size: 20))
                        }
                        
                        Divider()
                            .frame(height: 80)
                        
                        VStack(spacing: 15) {
                            Text("충전 크레딧")
                                .font(.pretendard(Pretendard.medium, size: 15))
                            
                            Text("10000원")
                                .font(.pretendard(Pretendard.medium, size: 17))
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                    
                    HStack {
                        HStack(spacing: 3) {
                            VStack {
                                Text("•")
                                    .font(.pretendard(size: 12))
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            VStack {
                                Text("크레딧 충전은 잼잼의\n공식 홈페이지를 통해 진행할 수 있습니다.")
                                    .font(.pretendard(size: 12))
                                    .foregroundStyle(.gray)
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Text("환불하기")
                                    .font(.pretendard(size: 13))
                                    .foregroundStyle(.gray)
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 10))
                                    .foregroundStyle(.gray)
                                    .padding(.trailing, 20)
                            }
                            .padding(.bottom, 13)
                        }
                    }
                    .padding(.bottom)
                    
                    HStack {
                        
                        
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
        ClientFinanceManagementView()
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
