//
//  WritingDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum WritingDetail: Int, CaseIterable, Codable {
    case copywriting = 92
    case contentWriting = 93
    case articleWriting = 94
    case reportWriting = 95
    case proposalWriting = 96
    case brandNaming = 97
    case sloganCreation = 98
    case webNovel = 99
    case scenarioWriting = 100
    case thesisWriting = 101
    case userManual = 102
    case blogPosting = 103
    case pressRelease = 104
    case essayGhostwriting = 105
    case emailWriting = 106

    var displayName: String {
        switch self {
        case .copywriting: return "카피라이팅"
        case .contentWriting: return "콘텐츠 라이팅"
        case .articleWriting: return "기사작성"
        case .reportWriting: return "보고서 작성"
        case .proposalWriting: return "제안서 작성"
        case .brandNaming: return "브랜드 네이밍"
        case .sloganCreation: return "슬로건 제작"
        case .webNovel: return "웹소설"
        case .scenarioWriting: return "시나리오"
        case .thesisWriting: return "논문작성"
        case .userManual: return "사용자 매뉴얼 작성"
        case .blogPosting: return "블로그 포스팅"
        case .pressRelease: return "홍보문 작성"
        case .essayGhostwriting: return "에세이 대필"
        case .emailWriting: return "이메일 작성"
        }
    }
}
