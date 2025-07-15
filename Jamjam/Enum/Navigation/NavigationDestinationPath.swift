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
    case orderServiceView(ServiceCellDomainModel)
    case serviceManagementView
}
