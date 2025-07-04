//
//  ProviderProfileSkillDetailSheetView.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import SwiftUI

struct ProviderProfileSkillDetailSheetView: View {
    @Binding var selectedDetailSkillIds: [Int]
    let targetSkill: Skill?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    switch targetSkill {
                    case .management:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.management.text)
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
                                    withAnimation(.spring(response: 0.1, dampingFraction: 1.0, blendDuration: 0)) {
                                        if let index = selectedDetailSkillIds.firstIndex(of: detailSkill.rawValue) {
                                            selectedDetailSkillIds.remove(at: index)
                                        } else {
                                            selectedDetailSkillIds.append(detailSkill.rawValue)
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
                            }
                        }
                        
                    case .consulting:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.consulting.text)
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
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDetailSkillIds.append(detailSkill.rawValue)
                                }
                                
                                Divider()
                            }
                        }
                        
                    case .marketing:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.marketing.text)
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
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDetailSkillIds.append(detailSkill.rawValue)
                                }
                                
                                Divider()
                            }
                        }
                        
                    case .development:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.development.text)
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
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDetailSkillIds.append(detailSkill.rawValue)
                                }
                                
                                Divider()
                            }
                        }
                        
                    case .design:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.design.text)
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
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDetailSkillIds.append(detailSkill.rawValue)
                                }
                                
                                Divider()
                            }
                        }
                        
                    case .writing:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.writing.text)
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
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDetailSkillIds.append(detailSkill.rawValue)
                                }
                                
                                Divider()
                            }
                        }
                        
                    case .translation:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.translation.text)
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
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDetailSkillIds.append(detailSkill.rawValue)
                                }
                                
                                Divider()
                            }
                        }
                        
                    case .media:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.media.text)
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
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDetailSkillIds.append(detailSkill.rawValue)
                                }
                                
                                Divider()
                            }
                        }
                        
                    case .education:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.education.text)
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
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDetailSkillIds.append(detailSkill.rawValue)
                                }
                                
                                Divider()
                            }
                        }
                        
                    case .customMade:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.customMade.text)
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
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDetailSkillIds.append(detailSkill.rawValue)
                                }
                                
                                Divider()
                            }
                        }
                        
                    case .hobbyLesson:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.hobbyLesson.text)
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
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDetailSkillIds.append(detailSkill.rawValue)
                                }
                                
                                Divider()
                            }
                        }
                        
                    case .lifeService:
                        VStack(spacing: 0) {
                            HStack {
                                Text(Skill.lifeService.text)
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
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 20)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedDetailSkillIds.append(detailSkill.rawValue)
                                }
                                
                                Divider()
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
