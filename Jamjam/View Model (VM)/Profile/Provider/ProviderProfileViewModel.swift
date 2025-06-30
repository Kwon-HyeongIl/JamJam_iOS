//
//  ProviderProfileViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/30/25.
//

import Foundation

@Observable
class ProviderProfileViewModel {
    
    var isTabBarVisible = true
    var selectedIndex = 0
    let tabBarList = [
        "전문가 정보", "서비스"
    ]
}
