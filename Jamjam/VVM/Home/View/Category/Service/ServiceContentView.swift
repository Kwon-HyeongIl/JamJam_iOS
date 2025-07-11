//
//  ServiceContentView.swift
//  Jamjam
//
//  Created by 권형일 on 7/11/25.
//

import SwiftUI

struct ServiceView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel: ServiceContentViewModel
    
    init(serviceId: Int) {
        viewModel = ServiceContentViewModel(serviceId: serviceId)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndHomeModifier())
    }
}

#Preview {
    NavigationStack {
        ServiceView(serviceId: 0)
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
