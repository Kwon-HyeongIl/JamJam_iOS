//
//  NavigationDestinationPath.swift
//  Jamjam
//
//  Created by 권형일 on 6/5/25.
//

import Foundation

enum NavigationDestinationPath: Hashable {
    // Auth
    case loginView
    case signUpView
    
    // Home
    case searchView
    case categoryView
    
    // Chat
    case chatContentView(ChatRoom)
    
    // Profile
    case providerProfileView
    
    case providerProfileEditListView
    case providerProfileIntroductionEditView(ProviderProfileEditViewModel)
    case providerProfileSkillEditView(ProviderProfileEditViewModel)
    case providerProfileCareerEditView(ProviderProfileEditViewModel)
    case providerProfileCertificationEditView(ProviderProfileEditViewModel)
    case providerProfileCallTimeEditView(ProviderProfileEditViewModel)
}
