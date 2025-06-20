//
//  CategoryViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/20/25.
//

import SwiftUI

@Observable
class CategoryViewModel {
    var lastOffset: CGFloat = 0
    var downAccum: CGFloat = 0
    var upAccum: CGFloat = 0
    var phase: ScrollPhase = .idle
    
    var isSearchBarVisible = true
    var isTabBarVisible = true
}
