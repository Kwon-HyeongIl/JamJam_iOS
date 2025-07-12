//
//  ProviderProfileSkillDetailSheetView.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import SwiftUI

struct ProviderProfileSkillDetailSheetView: View {
    @Binding var selectedDetailSkillIds: [Int]
    let targetSkill: SkillCategory?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    switch targetSkill {
                    case .management:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.management.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(ManagementDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .consulting:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.consulting.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(ConsultingDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .marketing:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.marketing.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(MarketingDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .development:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.development.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(DevelopmentDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .design:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.design.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(DesignDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .writing:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.writing.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(WritingDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .translation:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.translation.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(TranslationDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .media:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.media.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(MediaDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .education:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.education.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(EducationDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .customMade:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.customMade.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(CustomMadeDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .hobbyLesson:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.hobbyLesson.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(HobbyLessonDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .lifeService:
                        VStack(spacing: 0) {
                            HStack {
                                Text(SkillCategory.lifeService.text)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            ForEach(LifeServiceDetail.allCases, id: \.self) { detailSkill in
                                HStack {
                                    Text(detailSkill.text)
                                        .font(.pretendard(Pretendard.regular, size: 18))
                                        .foregroundStyle(selectedDetailSkillIds.contains(detailSkill.rawValue) ? Color.JJTitle : .black)
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation(.customAnimation) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            if selectedDetailSkillIds.count <= 20 {
                                                selectedDetailSkillIds.append(detailSkill.rawValue)
                                            }
                                        }
                                    }
                                }
                                .overlay {
                                    if selectedDetailSkillIds.contains(detailSkill.rawValue) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(height: 40)
                                            .foregroundStyle(.red.opacity(0.1))
                                            .padding(.horizontal, 10)
                                    }
                                }
                                
                                Divider()
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                    case .none:
                        VStack {}
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
    }
}

//#Preview {
//
//}
