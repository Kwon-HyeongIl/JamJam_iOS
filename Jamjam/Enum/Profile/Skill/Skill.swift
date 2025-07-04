//
//  Skill.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum Skill: Int, Codable {
    case none = 0
    case management = 1
    case consulting = 2
    case marketing = 3
    case development = 4
    case design = 5
    case writing = 6
    case translation = 7
    case media = 8
    case education = 9
    case customMade = 10
    case hobbyLesson = 11
    case lifeService = 12

    var displayName: String {
        switch self {
        case .none: return "전문 분야를 선택하세요"
        case .management: return "경영•기획"
        case .consulting: return "컨설팅•멘토링"
        case .marketing: return "마케팅•홍보"
        case .development: return "개발•IT"
        case .design: return "디자인•편집"
        case .writing: return "문서•작문"
        case .translation: return "번역•통역"
        case .media: return "사진•영상"
        case .education: return "교육•강의"
        case .customMade: return "주문 제작"
        case .hobbyLesson: return "취미 레슨"
        case .lifeService: return "생활 서비스"
        }
    }
}
