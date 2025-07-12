//
//  Animation+Custom.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import SwiftUI

extension Animation {
    static let customAnimation: Animation =
        .spring(response: 0.1, dampingFraction: 1.0, blendDuration: 0)
}
