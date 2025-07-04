//
//  ProviderProfileEditView.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import SwiftUI

struct ProviderProfileEditView: View {
    @State private var viewModel = ProviderProfileEditViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                
            }
            .modifierIf(viewModel.pageIndex == 0, then: {
                NavigationBarBackAndTitleModifier(title: "프로필 설정")
            }, else: {
                NavigationBarTitleAndHomeModifier(title: "프로필 설정")
            })
        }
        .background(Color.mainBackground)
    }
}

#Preview {
    ProviderProfileEditView()
}
