//
//  DesignDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum DesignDetail: Int, CaseIterable, Codable {
    case photoshop = 72
    case illustrator = 73
    case indesign = 74
    case adobeXD = 75
    case figma = 76
    case sketch = 77
    case canva = 78
    case afterEffects = 79
    case premierePro = 80
    case blender = 81
    case cinema4d = 82
    case threeDsMax = 83
    case maya = 84
    case autocad = 85
    case uiuxDesign = 86
    case mobileAppDesign = 87
    case webDesign = 88
    case packageDesign = 89
    case emoticonDesign = 90
    case bICIDesign = 91

    var text: String {
        switch self {
        case .photoshop: return "Adobe Photoshop"
        case .illustrator: return "Adobe Illustrator"
        case .indesign: return "Adobe InDesign"
        case .adobeXD: return "Adobe XD"
        case .figma: return "Figma"
        case .sketch: return "Sketch"
        case .canva: return "Canva"
        case .afterEffects: return "Adobe After Effects"
        case .premierePro: return "Adobe Premiere Pro"
        case .blender: return "Blender"
        case .cinema4d: return "Cinema 4D"
        case .threeDsMax: return "3ds Max"
        case .maya: return "Maya"
        case .autocad: return "AutoCAD"
        case .uiuxDesign: return "UI/UX 디자인"
        case .mobileAppDesign: return "모바일 앱 디자인"
        case .webDesign: return "웹디자인"
        case .packageDesign: return "패키지 디자인"
        case .emoticonDesign: return "이모티콘 디자인"
        case .bICIDesign: return "BI/CI 디자인"
        }
    }
}
