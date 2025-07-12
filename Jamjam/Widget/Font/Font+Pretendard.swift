//
//  Font+Pretendard.swift
//  Jamjam
//
//  Created by 권형일 on 6/23/25.
//

import SwiftUI

extension Font {
    static func pretendard(_ name: String = Pretendard.regular, size: CGFloat) -> Font {
        .custom(name, size: size)
    }
}
