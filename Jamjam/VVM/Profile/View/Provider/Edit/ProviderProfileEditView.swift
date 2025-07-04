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
                                    Text(Region.seoul.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .incheon
                                } label: {
                                    Text(Region.incheon.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .gyeonggi
                                } label: {
                                    Text(Region.gyeonggi.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .busan
                                } label: {
                                    Text(Region.busan.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .ulsan
                                } label: {
                                    Text(Region.ulsan.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .gyeongnam
                                } label: {
                                    Text(Region.gyeongnam.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .daegu
                                } label: {
                                    Text(Region.daegu.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .gyeongbuk
                                } label: {
                                    Text(Region.gyeongbuk.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .daejeon
                                } label: {
                                    Text(Region.daejeon.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .sejong
                                } label: {
                                    Text(Region.sejong.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .chungnam
                                } label: {
                                    Text(Region.chungnam.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .chungbuk
                                } label: {
                                    Text(Region.chungbuk.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .gwangju
                                } label: {
                                    Text(Region.gwangju.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .jeonnam
                                } label: {
                                    Text(Region.jeonnam.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .jeonbuk
                                } label: {
                                    Text(Region.jeonbuk.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .gangwon
                                } label: {
                                    Text(Region.gangwon.text)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = .jeju
                                } label: {
                                    Text(Region.jeju.text)
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
                                            Text(viewModel.selectedRegion?.text ?? "")
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
                                    Text(Skill.management.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .consulting
                                } label: {
                                    Text(Skill.consulting.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .marketing
                                } label: {
                                    Text(Skill.marketing.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .development
                                } label: {
                                    Text(Skill.development.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .design
                                } label: {
                                    Text(Skill.design.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .writing
                                } label: {
                                    Text(Skill.writing.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .translation
                                } label: {
                                    Text(Skill.translation.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .media
                                } label: {
                                    Text(Skill.media.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .education
                                } label: {
                                    Text(Skill.education.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .customMade
                                } label: {
                                    Text(Skill.customMade.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .hobbyLesson
                                } label: {
                                    Text(Skill.hobbyLesson.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .lifeService
                                } label: {
                                    Text(Skill.lifeService.text)
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
                                            Text(viewModel.selectedSkill?.text ?? "")
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
                    VStack(spacing: 0) {
                        ScrollView {
                            VStack(spacing: 0) {
                                
                                
                                ZStack {
                                    Rectangle()
                                        .frame(height: 80)
                                        .foregroundStyle(.gray.opacity(0.1))
                                        .padding(.top, 5)
                                        .overlay {
                                            if viewModel.selectedDetailSkillIds.isEmpty {
                                                VStack {
                                                    Text("아래에서 기술을 선택해주세요.")
                                                        .font(.pretendard(Pretendard.regular, size: 12))
                                                        .foregroundStyle(.gray)
                                                    
                                                    Text("최대 20개까지 선택할 수 있습니다.")
                                                        .font(.pretendard(Pretendard.regular, size: 12))
                                                        .foregroundStyle(.gray)
                                                }
                                            }
                                        }
                                    
                                    VStack(spacing: 0) {
                                        if !viewModel.selectedDetailSkillIds.isEmpty {
                                            HStack {
                                                Text("\(viewModel.selectedDetailSkillIds.count)개 선택됨")
                                                    .font(.pretendard(size: 12))
                                                    .foregroundStyle(.gray.opacity(0.7))
                                                    .padding(.leading, 20)
                                                    .padding(.bottom, 8)
                                                
                                                Spacer()
                                            }
                                        }
                                        
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 0) {
                                                ForEach(Array(viewModel.selectedDetailSkillIds.enumerated()), id: \.element) { index, detailSkillId in
                                                    
                                                    HStack(spacing: 10) {
                                                        Text(viewModel.detailSkillText(id: detailSkillId) ?? "")
                                                            .font(.pretendard(size: 16))
                                                            .foregroundStyle(Color.JJTitle)
                                                        
                                                        Button {
                                                            // 삭제 액션
                                                        } label: {
                                                            Image(systemName: "xmark")
                                                                .font(.system(size: 12))
                                                                .foregroundStyle(.gray.opacity(0.5))
                                                        }
                                                    }
                                                    .padding(.horizontal, 13)
                                                    .padding(.vertical, 6)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 30)
                                                            .foregroundStyle(.red.opacity(0.1))
                                                            .overlay {
                                                                RoundedRectangle(cornerRadius: 30)
                                                                    .strokeBorder(Color.JJTitle, lineWidth: 1)
                                                            }
                                                        
                                                    )
                                                    .fixedSize()
                                                    .padding(.leading, viewModel.selectedDetailSkillIds.isEmpty ? 0 : 20)
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                VStack(spacing: 0) {
                                    ForEach(Array(Skill.allCases.enumerated()), id: \.element) { index, currentSkill in
                                        HStack {
                                            Text(currentSkill.text)
                                                .font(.pretendard(Pretendard.regular, size: 18))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                        .padding(.vertical, 20)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            viewModel.tappedSkill = currentSkill
                                            viewModel.isSheetVisible = true
                                        }
                                        
                                        Divider()
                                            .padding(.horizontal, 10)
                                    }
                                }
                            }
                        }
                    }
                    .sheet(isPresented: $viewModel.isSheetVisible) {
                        viewModel.tappedSkill = nil
                    } content: {
                        ProviderProfileSkillDetailSheetView(selectedDetailSkillIds: $viewModel.selectedDetailSkillIds, targetSkill: viewModel.tappedSkill)
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
                VStack(spacing: 0) {
                    Divider()
                    
                    Spacer()
                    
                    switch viewModel.pageIndex {
                    case 0:
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
                        
                    case 1:
                        HStack(spacing: 15) {
                            Button {
                                viewModel.pageIndex = 0
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(.white)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                    }
                                    .overlay {
                                        Text("이전")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(.leading, 20)
                            }
                            
                            Button {
                                viewModel.pageIndex = 2
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        Text("다음")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.trailing, 20)
                                    .opacity(viewModel.selectedDetailSkillIds.isEmpty ? 0.4 : 1)
                                    .disabled(viewModel.selectedDetailSkillIds.isEmpty)
                            }
                        }
                        
                    default:
                        VStack {}
                    }
                    
                    Spacer()
                }
                .frame(height: 70)
                .background(Color.mainBackground)
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
            .environment(MainTabBarCapsule())
    }
}
