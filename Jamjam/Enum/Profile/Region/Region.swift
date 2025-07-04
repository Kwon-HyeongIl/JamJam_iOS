//
//  Region.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum Region: Int, Codable {
    case seoul = 1
    case incheon = 2
    case gyeonggi = 3
    case busan = 4
    case ulsan = 5
    case gyeongnam = 6
    case daegu = 7
    case gyeongbuk = 8
    case daejeon = 9
    case sejong = 10
    case chungnam = 11
    case chungbuk = 12
    case gwangju = 13
    case jeonnam = 14
    case jeonbuk = 15
    case gangwon = 16
    case jeju = 17
    
    var displayName: String {
        switch self {
        case .seoul: return "서울특별시"
        case .incheon: return "인천광역시"
        case .gyeonggi: return "경기도"
        case .busan: return "부산광역시"
        case .ulsan: return "울산광역시"
        case .gyeongnam: return "경상남도"
        case .daegu: return "대구광역시"
        case .gyeongbuk: return "경상북도"
        case .daejeon: return "대전광역시"
        case .sejong: return "세종특별자치시"
        case .chungnam: return "충청남도"
        case .chungbuk: return "충청북도"
        case .gwangju: return "광주광역시"
        case .jeonnam: return "전라남도"
        case .jeonbuk: return "전북특별자치도"
        case .gangwon: return "강원특별자치도"
        case .jeju: return "제주특별자치도"
        }
    }
}

