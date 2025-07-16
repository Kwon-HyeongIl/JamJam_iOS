//
//  OrderDetailDomainModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/17/25.
//

import Foundation

struct OrderDetailDomainModel {
    let title: String
    let clientId: Int
    let providerId: Int
    let deadLine: String
    let deadLineDday: String
    let description: String
    let referenceFiles: [OrderReferenceFileDomainModel]?
    let cancelReason: String?
}
