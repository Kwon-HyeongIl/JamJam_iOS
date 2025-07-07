//
//  WriteServiceTailView.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import SwiftUI

struct RegisterServiceTailView: View {
    @Environment(NavigationCore.self) var navRouter
    @Bindable var viewModel: RegisterServiceViewModel
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarTitleAndHomeModifier(title: "서비스 등록"))
        .onTapGesture {
            focus = nil
        }
    }
}

#Preview {
    NavigationStack {
        RegisterServiceTailView(viewModel: RegisterServiceViewModel())
            .environment(NavigationCore())
    }
}
