//
//  SearchView.swift
//  Jamjam
//
//  Created by 권형일 on 6/13/25.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            
        }
        .modifier(NavigationBarBackAndTitleModifier(title: "검색"))
    }
}

#Preview {
    SearchView()
}
