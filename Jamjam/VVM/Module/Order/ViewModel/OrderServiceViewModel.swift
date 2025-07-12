//
//  OrderServiceViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/12/25.
//

import Foundation

@Observable
class OrderServiceViewModel {
    var isEntireProgressViewVisible = false
    var isOrderAlertVisible = false
    var orderAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
}
