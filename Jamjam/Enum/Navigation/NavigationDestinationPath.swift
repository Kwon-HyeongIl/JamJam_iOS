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
    case categoryView(Skill)
    case serviceView(Int)
    
    // Write
    case registerServiceLeadView
    case registerServiceTailView(RegisterServiceViewModel)
    
    // Chat
    case chatContentView(ChatRoomDomainModel)
    
    // Profile
    case beforeCheckPasswordView(UserDomainModel?)
    case editUserInfoView(UserDomainModel?)
    case providerProfileView
    case providerProfileEditView
}
