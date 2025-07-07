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
            SearchView()
        case .categoryView:
            CategoryView()
            
            // MARK: Write
        case .registerServiceTailView(let viewModel):
            RegisterServiceTailView(viewModel: viewModel)
            
            // MARK: Chat
        case .chatContentView(let chatRoom):
            ChatContentView(chatRoom: chatRoom)
            
            // MARK: Profile
        case .providerProfileView:
            ProviderProfileView()
        case .providerProfileEditListView:
            ProviderProfileEditView()
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
