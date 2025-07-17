//
//  NavigationRouter.swift
//  Jamjam
//
//  Created by 권형일 on 6/5/25.
//

import SwiftUI

@Observable
class NavigationCore {
    var path = NavigationPath()
    
    @ViewBuilder
    func destinationNavigate(to view: NavigationDestinationPath) -> some View {
        switch view {
            // MARK: Auth
        case .loginView:
            LoginView()
        case .signUpView:
            SignUpView()
            
            // MARK: Credit
        case .creditManagementView:
            CreditManagementView()
            
            // MARK: Home
        case .searchView:
            SearchServiceView()
        case .categoryView(let skill):
            CategoryView(skill: skill)
            
            // MARK: Write
        case .registerServiceLeadView:
            RegisterServiceLeadView()
        case .registerServiceTailView(let viewModel):
            RegisterServiceTailView(viewModel: viewModel)
            
            // MARK: Chat
        case .chatContentView(let roomId, let nickname, let profileImageUrl):
            ChatContentView(roomId: roomId, nickname: nickname, profileImageUrl: profileImageUrl)
            
            // MARK: Profile
        case .beforeCheckPasswordView:
            BeforeCheckPasswordView()
        case .editUserInfoView:
            EditUserInfoView()
        case .providerProfileView(let userId):
            ProviderProfileView(userId: userId)
        case .editProviderProfileView:
            EditProviderProfileView()
        case .editNotificationView:
            EditNotificationView()
            
            // MARK: Service
        case .serviceView(let serviceId):
            ServiceView(serviceId: serviceId)
            
            // MARK: Order
        case .orderServiceRequestView(let serviceCell):
            OrderServiceRequestView(serviceCell: serviceCell)
            
        case .providerServiceManagementView:
            ProviderServiceManagementView()
        case .providerRequestedOrderView(let orderId):
            ProviderRequestedOrderView(orderId: orderId)
        case .providerPreparingOrderView(let orderId):
            ProviderPreparingOrderView(orderId: orderId)
        case .providerCompletedOrderView(let orderId):
            ProviderCompletedOrderView(orderId: orderId)
        case .providerCancelledOrderView(let orderId):
            ProviderCancelledOrderView(orderId: orderId)
            
        case .clientServiceManagementView:
            ClientServiceManagementView()
        case .clientRquestedOrderView(let orderId):
            ClientRquestedOrderView(orderId: orderId)
        case .clientPreparingOrderView(let orderId):
            ClientPreparingOrderView(orderId: orderId)
        case .clientCompletedOrderView(let orderId):
            ClientCompletedOrderView(orderId: orderId)
        case .clientCancelledOrderView(let orderId):
            ClientCancelledOrderView(orderId: orderId)
            
        }
    }
    
    @MainActor
    func navigate(_ view: NavigationDestinationPath) {
        path.append(view)
    }
    
    @MainActor
    func back() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    @MainActor
    func popToRoot() {
        if !path.isEmpty {
            path.removeLast(path.count)
        }
    }
}
