//
//  ProfileInfoManager.swift
//  Jamjam
//
//  Created by 권형일 on 7/5/25.
//

import Foundation

class ProfileInfoManager {
    static func extractDetailSkillTextWithId(id: Int) -> String? {
        if let item = ManagementDetail(rawValue: id) {
            return item.text
        } else if let item = ConsultingDetail(rawValue: id) {
            return item.text
        } else if let item = MarketingDetail(rawValue: id) {
            return item.text
        } else if let item = DevelopmentDetail(rawValue: id) {
            return item.text
        } else if let item = DesignDetail(rawValue: id) {
            return item.text
        } else if let item = WritingDetail(rawValue: id) {
            return item.text
        } else if let item = TranslationDetail(rawValue: id) {
            return item.text
        } else if let item = MediaDetail(rawValue: id) {
            return item.text
        } else if let item = EducationDetail(rawValue: id) {
            return item.text
        } else if let item = CustomMadeDetail(rawValue: id) {
            return item.text
        } else if let item = HobbyLessonDetail(rawValue: id) {
            return item.text
        } else if let item = LifeServiceDetail(rawValue: id) {
            return item.text
        } else {
            return nil
        }
    }
}
