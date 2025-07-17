//
//  ClientServiceManagementView.swift
//  Jamjam
//
//  Created by 권형일 on 7/16/25.
//

import SwiftUI

struct ClientServiceManagementView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = ClientServiceManagementViewModel()
    
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
                                viewModel.restoreOrders()
                                viewModel.fetchOrders()
                            }
                        }
                    }
                }
            }
            
            ScrollView {
                VStack(spacing: 5) {
                    ForEach(viewModel.orders, id: \.orderId) { order in
                        OrderCellView(orderCell: order)
                            .onAppear {
                                if order.orderId == viewModel.orders.last?.orderId {
                                    viewModel.fetchOrders()
                                }
                            }
                            .onTapGesture {
                                switch viewModel.segmentedControlIndex {
                                case 0:
                                    navRouter.navigate(.clientRquestedOrderView(order.orderId))
                                case 1:
                                    navRouter.navigate(. clientPreparingOrderView(order.orderId))
                                case 2:
                                    navRouter.navigate(.clientCompletedOrderView(order.orderId))
                                case 3:
                                    navRouter.navigate(.clientCancelledOrderView(order.orderId))
                                default:
                                    return
                                }
                            }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleAndHomeModifier(title: "서비스 관리"))
        .onAppear {
            viewModel.fetchOrders()
        }
    }
}

#Preview {
    NavigationStack {
        ClientServiceManagementView()
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
