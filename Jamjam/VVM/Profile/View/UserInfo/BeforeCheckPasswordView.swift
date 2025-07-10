//
//  CheckPasswordView.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import SwiftUI

struct BeforeCheckPasswordView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel: BeforeCheckPasswordViewModel
    
    init(user: UserDomainModel?) {
        viewModel = BeforeCheckPasswordViewModel(user: user)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NavigationStack {
        BeforeCheckPasswordView(user: nil)
            .environment(NavigationCore())
    }
}
