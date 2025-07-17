//
//  NavigationDestinationPath.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import Foundation

enum NavigationDestinationPath: Hashable {
    // Auth
    case loginView
    case signUpView
    
    // Credit
    case creditManagementView
    
    // Home
    case searchView
    case categoryView(SkillCategory)
    
    // Write
    case registerServiceLeadView
    case registerServiceTailView(RegisterServiceViewModel)
    
    // Chat
    case chatContentView(Int?, String?, String?)
    
    // Profile
    case beforeCheckPasswordView
    case editUserInfoView
    case providerProfileView(Int)
    case editProviderProfileView
    case editNotificationView
    
    // Service
    case serviceView(Int)
    
    // Order
    case orderServiceRequestView(ServiceCellDomainModel)
    
    case providerServiceManagementView
    case providerRequestedOrderView(Int?)
    case providerPreparingOrderView(Int?)
    case providerCompletedOrderView(Int?)
    case providerCancelledOrderView(Int?)
    
    case clientServiceManagementView
    case clientRquestedOrderView(Int?)
    case clientPreparingOrderView(Int?)
    case clientCompletedOrderView(Int?)
    case clientCancelledOrderView(Int?)
}
