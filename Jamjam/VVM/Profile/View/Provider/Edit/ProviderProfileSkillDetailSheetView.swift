//
//  ProviderProfileSkillDetailSheetView.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import SwiftUI

struct ProviderProfileSkillDetailSheetView: View {
    @Binding var selectedSkillDetailId: [Int]
    let targetSkill: Skill?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 20) {
                    switch targetSkill {
                    case .management:
                        ForEach(ManagementDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
                        }
                        
                    case .consulting:
                        ForEach(ConsultingDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
                        }
                        
                    case .marketing:
                        ForEach(MarketingDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
                        }
                        
                    case .development:
                        ForEach(DevelopmentDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
                        }
                        
                    case .design:
                        ForEach(DesignDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
                        }
                        
                    case .writing:
                        ForEach(WritingDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
                        }
                        
                    case .translation:
                        ForEach(TranslationDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
                        }
                        
                    case .media:
                        ForEach(MediaDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
                        }
                        
                    case .education:
                        ForEach(EducationDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
                        }
                        
                    case .customMade:
                        ForEach(CustomMadeDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
                        }
                        
                    case .hobbyLesson:
                        ForEach(HobbyLessonDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
                        }
                        
                    case .lifeService:
                        ForEach(LifeServiceDetail.allCases, id: \.self) { detailSkill in
                            HStack {
                                Text(detailSkill.displayName)
                                    .font(.pretendard(Pretendard.regular, size: 18))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Divider()
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

#Preview {
    ProviderProfileSkillDetailSheetView(selectedSkillDetailId: .constant([]), targetSkill: nil)
}
