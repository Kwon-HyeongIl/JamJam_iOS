//
//  MediaDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum MediaDetail: Int, CaseIterable, Codable {
    case productPhotography = 122
    case portraitPhotography = 123
    case weddingPhotography = 124
    case brandingPhotography = 125
    case eventPhotography = 126
    case promotionalVideo = 127
    case youtubeVideo = 128
    case animation = 129
    case motionGraphics = 130
    case videoEditing = 131
    case vlogProduction = 132
    case shortsEditing = 133
    case interviewVideo = 134
    case musicVideoProduction = 135
    case droneFilming = 136

    var displayName: String {
        switch self {
        case .productPhotography: return "상품사진"
        case .portraitPhotography: return "인물사진"
        case .weddingPhotography: return "웨딩사진"
        case .brandingPhotography: return "브랜딩 사진"
        case .eventPhotography: return "행사사진"
        case .promotionalVideo: return "홍보영상"
        case .youtubeVideo: return "유튜브 영상"
        case .animation: return "애니메이션"
        case .motionGraphics: return "모션그래픽"
        case .videoEditing: return "영상편집"
        case .vlogProduction: return "Vlog 제작"
        case .shortsEditing: return "쇼츠 편집"
        case .interviewVideo: return "인터뷰 영상"
        case .musicVideoProduction: return "뮤직비디오 제작"
        case .droneFilming: return "드론 촬영"
        }
    }
}
