//
//  HobbyLessonDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum HobbyLessonDetail: Int, CaseIterable, Codable {
    case pianoLesson = 167
    case guitarLesson = 168
    case drumLesson = 169
    case vocalLesson = 170
    case danceLesson = 171
    case yogaLesson = 172
    case pilatesLesson = 173
    case drawingLesson = 174
    case calligraphyLesson = 175
    case cookingLesson = 176
    case bakingLesson = 177
    case flowerClass = 178
    case calligraphyClass = 179
    case photographyBasics = 180
    case digitalDrawing = 181

    var displayName: String {
        switch self {
        case .pianoLesson: return "피아노"
        case .guitarLesson: return "기타"
        case .drumLesson: return "드럼"
        case .vocalLesson: return "보컬"
        case .danceLesson: return "댄스"
        case .yogaLesson: return "요가"
        case .pilatesLesson: return "필라테스"
        case .drawingLesson: return "그림 그리기"
        case .calligraphyLesson: return "서예"
        case .cookingLesson: return "요리"
        case .bakingLesson: return "베이킹"
        case .flowerClass: return "플라워 클래스"
        case .calligraphyClass: return "캘리그라피 레슨"
        case .photographyBasics: return "사진 입문"
        case .digitalDrawing: return "디지털 드로잉"
        }
    }
}
