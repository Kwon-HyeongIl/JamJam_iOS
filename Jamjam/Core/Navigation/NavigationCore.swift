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
        case .orderServiceView(let serviceCell):
            OrderServiceView(serviceCell: serviceCell)
        case .serviceManagementView:
            ProviderServiceManagementView()
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
