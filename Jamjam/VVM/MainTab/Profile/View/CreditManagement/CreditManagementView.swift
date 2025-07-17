//
//  ProviderFinanceManagementView.swift
//  Jamjam
//
//  Created by 권형일 on 7/15/25.
//

import SwiftUI

struct CreditManagementView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = CreditManagementViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    VStack(spacing: 20) {
                        VStack(spacing: 12) {
                            HStack {
                                Text("보유중인 크레딧")
                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                    .padding(.leading, 15)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text("10000원")
                                    .font(.pretendard(Pretendard.semiBold, size: 25))
                                    .padding(.leading, 15)
                                
                                Spacer()
                            }
                        }
                        
                        Button {
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundStyle(.white)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.JJTitle, lineWidth: 1)
                                }
                                .overlay {
                                    Text("출금")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .foregroundStyle(Color.JJTitle)
                                }
                                .padding(.horizontal, 15)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 155)
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("• 크레딧 충전은 잼잼 공식 홈페이지를 통해 진행할 수 있습니다.")
                            .font(.pretendard(size: 12))
                            .foregroundStyle(.gray)
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                    
                    HStack {
                        Menu {
                            Button {
                                viewModel.creditHistorySegmentedControl = .all
                            } label: {
                                Text("전체")
                            }
                            
                            Button {
                                viewModel.creditHistorySegmentedControl = .deposit
                            } label: {
                                Text("입금")
                            }
                            
                            Button {
                                viewModel.creditHistorySegmentedControl = .withdraw
                            } label: {
                                Text("출금")
                            }
                        } label: {
                            HStack(spacing: 25) {
                                Text("전체")
                                    .font(.pretendard(size: 14))
                                    .foregroundStyle(.black)
                                
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.black)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray.opacity(0.2), lineWidth: 1)
                            }
                            .padding(.leading, 20)
                        }
                        
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                    VStack {
                        HStack {
                            Text("날짜")
                                .font(.pretendard(Pretendard.medium, size: 15))
                                .padding(.leading, 50)
                            
                            Spacer()
                            
                            Text("사유")
                                .font(.pretendard(Pretendard.medium, size: 15))
                            
                            Spacer()
                            
                            Text("금액")
                                .font(.pretendard(Pretendard.medium, size: 15))
                                .padding(.trailing, 50)
                        }
                        
                        Divider()
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom)
                    
                    VStack(spacing: 0) {
                        ForEach(viewModel.creditHistorys, id: \.historyId) { creditHistory in
                            HStack {
                                Text(creditHistory.createdAt)
                                    .font(.pretendard(size: 14))
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 20)
                                
                                Spacer()
                                
                                Text(creditHistory.reason)
                                    .font(.pretendard(size: 14))
                                
                                Spacer()
                                
                                if creditHistory.reason == "크레딧 결제" {
                                    Text("+\(creditHistory.createdAt)원")
                                        .font(.pretendard(size: 14))
                                        .foregroundStyle(.green)
                                        .padding(.trailing, 20)
                                    
                                } else {
                                    Text("-\(creditHistory.createdAt)원")
                                        .font(.pretendard(size: 14))
                                        .foregroundStyle(.red)
                                        .padding(.trailing, 20)
                                }
                            }
                            .onAppear {
                                if creditHistory.historyId == viewModel.creditHistorys.last?.historyId {
                                    viewModel.fetchCreditHistorys()
                                }
                            }
                            
                            Divider()
                        }
                    }
                    .onChange(of: viewModel.creditHistorySegmentedControl) {
                        viewModel.restoreHistories()
                        viewModel.fetchCreditHistorys()
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
