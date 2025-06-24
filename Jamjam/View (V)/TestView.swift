//
//  TestView.swift
//  Jamjam
//
//  Created by 권형일 on 6/24/25.
//

import SwiftUI

struct TestView: View {
    @State private var viewModel = TestViewModel()
    
    var body: some View {
        Button {
            viewModel.request()
        } label: {
            Text("통신")
        }
    }
}

#Preview {
    TestView()
}
