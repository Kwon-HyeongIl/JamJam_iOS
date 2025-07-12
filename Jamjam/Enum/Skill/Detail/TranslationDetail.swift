//
//  TranslationDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum TranslationDetail: Int, CaseIterable, Codable {
    case englishTranslation = 107
    case chineseTranslation = 108
    case japaneseTranslation = 109
    case germanTranslation = 110
    case frenchTranslation = 111
    case simultaneousInterpretation = 112
    case consecutiveInterpretation = 113
    case documentTranslation = 114
    case medicalTranslation = 115
    case technicalTranslation = 116
    case legalTranslation = 117
    case subtitleTranslation = 118
    case videoTranslation = 119
    case gameTranslation = 120
    case interpretationGuide = 121

    var text: String {
        switch self {
        case .englishTranslation: return "영어 번역"
        case .chineseTranslation: return "중국어 번역"
        case .japaneseTranslation: return "일본어 번역"
        case .germanTranslation: return "독일어 번역"
        case .frenchTranslation: return "프랑스어 번역"
        case .simultaneousInterpretation: return "동시통역"
        case .consecutiveInterpretation: return "순차통역"
        case .documentTranslation: return "문서번역"
        case .medicalTranslation: return "의료번역"
        case .technicalTranslation: return "기술번역"
        case .legalTranslation: return "법률 번역"
        case .subtitleTranslation: return "자막 번역"
        case .videoTranslation: return "영상번역"
        case .gameTranslation: return "게임 번역"
        case .interpretationGuide: return "통역 가이드"
        }
    }
}
