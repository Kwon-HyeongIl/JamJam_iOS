//
//  CategoryViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/20/25.
//

import SwiftUI

@Observable
class CategoryViewModel {
    // Category
    var selectedIndex = 0
    let categories = [
        "경영•기획","컨설팅•멘토링","마케팅•홍보","개발•IT","디자인•편집",
        "문서•작문","번역•통역","사진•영상","교육•강의","주문 제작"
    ]
}
