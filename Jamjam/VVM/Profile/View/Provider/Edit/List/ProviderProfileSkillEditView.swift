//
//  ProviderProfileSkillEditView.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import SwiftUI

struct ProviderProfileSkillEditView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: ProviderProfileEditViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ProviderProfileSkillEditView(viewModel: ProviderProfileEditViewModel())
        .environment(NavigationRouter())
}
