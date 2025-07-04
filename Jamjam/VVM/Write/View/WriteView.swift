//
//  WriteView.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import SwiftUI

struct WriteView: View {
    var body: some View {
        MainBackground {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        Text("작성")
                            .font(.pretendard(Pretendard.semiBold, size: 25))
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                }
                .frame(height: 50)
                .background(Color.mainBackground)
            }
        }
    }
}

#Preview {
    WriteView()
}
