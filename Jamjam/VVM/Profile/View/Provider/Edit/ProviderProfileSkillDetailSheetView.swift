//
//  ProviderProfileSkillDetailSheetView.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import SwiftUI

struct ProviderProfileSkillDetailSheetView: View {
    @Binding var selectedDetailSkills: [Skill]
    let targetSkill: Skill?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    switch targetSkill {
                    case .management:
                        VStack {
                            HStack {
                                Text(Skill.management.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(ManagementDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        
                    case .consulting:
                        VStack {
                            HStack {
                                Text(Skill.consulting.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(ConsultingDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        
                    case .marketing:
                        VStack {
                            HStack {
                                Text(Skill.marketing.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(MarketingDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        
                    case .development:
                        VStack {
                            HStack {
                                Text(Skill.development.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(DevelopmentDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        
                    case .design:
                        VStack {
                            HStack {
                                Text(Skill.design.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(DesignDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        
                    case .writing:
                        VStack {
                            HStack {
                                Text(Skill.writing.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(WritingDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        
                    case .translation:
                        VStack {
                            HStack {
                                Text(Skill.translation.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(TranslationDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        
                    case .media:
                        VStack {
                            HStack {
                                Text(Skill.media.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(MediaDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        
                    case .education:
                        VStack {
                            HStack {
                                Text(Skill.education.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(EducationDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        
                    case .customMade:
                        VStack {
                            HStack {
                                Text(Skill.customMade.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(CustomMadeDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        
                    case .hobbyLesson:
                        VStack {
                            HStack {
                                Text(Skill.hobbyLesson.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(HobbyLessonDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
                            }
                        }
                        
                    case .lifeService:
                        VStack {
                            HStack {
                                Text(Skill.lifeService.displayName)
                                    .font(.pretendard(Pretendard.semiBold, size: 23))
                                    .padding(.leading, 20)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                            }
                            
                            VStack(spacing: 20) {
                                ForEach(LifeServiceDetail.allCases, id: \.self) { detailSkill in
                                    HStack {
                                        Text(detailSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    Divider()
                                }
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

#Preview {
    ProviderProfileSkillDetailSheetView(selectedDetailSkills: .constant([]), targetSkill: nil)
}
