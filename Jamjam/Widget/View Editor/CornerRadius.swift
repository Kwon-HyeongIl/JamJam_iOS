//
//  CornerRadius.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
