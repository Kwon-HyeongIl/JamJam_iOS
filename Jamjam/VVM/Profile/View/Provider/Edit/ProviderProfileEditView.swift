//
//  ProviderProfileEditView.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import SwiftUI

struct ProviderProfileEditView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State var viewModel = ProviderProfileEditViewModel()
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                switch viewModel.pageIndex {
                    // MARK: Page Index 0
                case 0:
                    VStack(spacing: 30) {
                        // MARK: 자기 소개
                        VStack {
                            HStack {
                                Text("자기 소개")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            TextField("자기 소개를 입력하세요.", text: $viewModel.inputIntroduction, axis: .vertical)
                                .focused($focus, equals: .first)
                                .font(.pretendard(size: 15))
                                .lineLimit(1...15)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                .frame(minHeight: 100)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(focus == .first ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .first ? 1.5 : 1)
                                }
                                .padding(.horizontal, 20)
                        }
                        .padding(.top)
                        
                        // MARK: 지역
                        VStack {
                            HStack {
                                Text("지역")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Menu {
                                Button {
                                    viewModel.selectedRegion = .seoul
                                } label: {
                                    Text(Region.seoul.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .incheon
                                } label: {
                                    Text(Region.incheon.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .gyeonggi
                                } label: {
                                    Text(Region.gyeonggi.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .busan
                                } label: {
                                    Text(Region.busan.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .ulsan
                                } label: {
                                    Text(Region.ulsan.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .gyeongnam
                                } label: {
                                    Text(Region.gyeongnam.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .daegu
                                } label: {
                                    Text(Region.daegu.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .gyeongbuk
                                } label: {
                                    Text(Region.gyeongbuk.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .daejeon
                                } label: {
                                    Text(Region.daejeon.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .sejong
                                } label: {
                                    Text(Region.sejong.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .chungnam
                                } label: {
                                    Text(Region.chungnam.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .chungbuk
                                } label: {
                                    Text(Region.chungbuk.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .gwangju
                                } label: {
                                    Text(Region.gwangju.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .jeonnam
                                } label: {
                                    Text(Region.jeonnam.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .jeonbuk
                                } label: {
                                    Text(Region.jeonbuk.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .gangwon
                                } label: {
                                    Text(Region.gangwon.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .jeju
                                } label: {
                                    Text(Region.jeju.displayName)
                                }
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 50)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 20)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                            .padding(.horizontal, 20)
                                    }
                                    .overlay {
                                        HStack {
                                            Text(viewModel.selectedRegion?.displayName ?? "")
                                                .font(.pretendard(size: 14.5))
                                                .foregroundStyle(.gray.opacity(0.55))
                                                .padding(.leading, 35)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.up.chevron.down")
                                                .font(.system(size: 14.5))
                                                .foregroundStyle(.gray.opacity(0.55))
                                                .padding(.trailing, 35)
                                        }
                                    }
                                
                            }
                        }
                        
                        // MARK: 전문 분야
                        VStack {
                            HStack {
                                Text("전문 분야")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Menu {
                                Button {
                                    viewModel.selectedSkill = .management
                                } label: {
                                    Text(Skill.management.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .consulting
                                } label: {
                                    Text(Skill.consulting.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .marketing
                                } label: {
                                    Text(Skill.marketing.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .development
                                } label: {
                                    Text(Skill.development.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .design
                                } label: {
                                    Text(Skill.design.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .writing
                                } label: {
                                    Text(Skill.writing.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .translation
                                } label: {
                                    Text(Skill.translation.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .media
                                } label: {
                                    Text(Skill.media.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .education
                                } label: {
                                    Text(Skill.education.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .customMade
                                } label: {
                                    Text(Skill.customMade.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .hobbyLesson
                                } label: {
                                    Text(Skill.hobbyLesson.displayName)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .lifeService
                                } label: {
                                    Text(Skill.lifeService.displayName)
                                }
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 50)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 20)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                            .padding(.horizontal, 20)
                                    }
                                    .overlay {
                                        HStack {
                                            Text(viewModel.selectedSkill?.displayName ?? "")
                                                .font(.pretendard(size: 14.5))
                                                .foregroundStyle(.gray.opacity(0.55))
                                                .padding(.leading, 35)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.up.chevron.down")
                                                .font(.system(size: 14.5))
                                                .foregroundStyle(.gray.opacity(0.55))
                                                .padding(.trailing, 35)
                                        }
                                    }
                                
                            }
                        }
                        
                        VStack {}
                            .frame(width: 1, height: 90)
                    }
                    
                case 1:
                    VStack(spacing: 30) {
                        ScrollView {
                            VStack(spacing: 20) {
                                ForEach(Array(Skill.allCases.enumerated()), id: \.element) { index, currentSkill in
                                    HStack {
                                        Text(currentSkill.displayName)
                                            .font(.pretendard(Pretendard.regular, size: 18))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    .onTapGesture {
                                        viewModel.tappedSkill = currentSkill
                                        viewModel.isSheetVisible = true
                                    }
                                    .padding(.top, index == 0 ? 15 : 0)
                                    
                                    Divider()
                                }
                            }
                        }
                    }
                    .sheet(isPresented: $viewModel.isSheetVisible) {
                        viewModel.tappedSkill = nil
                    } content: {
                        ProviderProfileSkillDetailSheetView(selectedDetailSkills: $viewModel.selectedDetailSkills, targetSkill: viewModel.tappedSkill)
                            .presentationDragIndicator(.visible)
                            .presentationDetents([.medium, .large])
                    }
                    
                default:
                    VStack {}
                }
                
                VStack {}
                    .frame(width: 1, height: 90)
            }
            .safeAreaInset(edge: .bottom) {
                switch viewModel.pageIndex {
                case 0:
                    VStack(spacing: 0) {
                        Divider()
                        
                        Spacer()
                        
                        Button {
                            viewModel.pageIndex = 1
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundStyle(Color.JJTitle)
                                .padding(.horizontal, 20)
                                .overlay {
                                    Text("다음")
                                        .font(.pretendard(Pretendard.semiBold, size: 15))
                                        .foregroundStyle(.white)
                                }
                        }
                        
                        Spacer()
                    }
                    .frame(height: 70)
                    .background(Color.mainBackground)
                    
                default:
                    VStack {}
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifierIf(viewModel.pageIndex == 0, then: {
            NavigationBarBackAndTitleModifier(title: viewModel.title)
        }, else: {
            NavigationBarTitleAndHomeModifier(title: viewModel.title)
        })
        .onTapGesture {
            focus = nil
        }
    }
}

#Preview {
    NavigationStack {
        ProviderProfileEditView()
            .environment(NavigationRouter())
    }
}
