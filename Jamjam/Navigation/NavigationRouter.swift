//
//  NavigationRouter.swift
//  Jamjam
//
//  Created by 권형일 on 6/5/25.
//

import SwiftUI

@Observable
class NavigationRouter {
    var path = NavigationPath()
    
    @ViewBuilder
    func destinationNavigate(to view: NavigationDestinationPath) -> some View {
        switch view {
            // Auth
        case .loginView:
            LoginView()
        case .signUpView:
            SignUpView()
            
            // Home
        case .searchView:
            SearchView()
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
