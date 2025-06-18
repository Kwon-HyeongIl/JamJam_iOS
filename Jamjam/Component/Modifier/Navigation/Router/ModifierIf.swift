//
//  ModifierIf.swift
//  Jamjam
//
//  Created by 권형일 on 6/18/25.
//

import SwiftUI

extension View {
    @ViewBuilder
    func modifierIf<TrueMod: ViewModifier, FalseMod: ViewModifier>(
        _ condition: Bool,
        then trueMod: @escaping () -> TrueMod,
        else falseMod: @escaping () -> FalseMod
    ) -> some View {
        if condition {
            self.modifier(trueMod())
        } else {
            self.modifier(falseMod())
        }
    }
}
