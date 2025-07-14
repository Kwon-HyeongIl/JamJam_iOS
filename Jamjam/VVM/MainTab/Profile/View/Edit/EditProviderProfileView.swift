//
//  ProviderProfileEditView.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import SwiftUI
import RangeSlider

struct EditProviderProfileView: View {
    @Environment(NavigationCore.self) var navRouter
    @Environment(IsNeedUserInfoLoadCapsule.self) var isNeedUserInfoLoadCapsule
    @State var viewModel = EditProviderProfileViewModel()
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                switch viewModel.pageIndex {
                    // MARK: Page Index 0
                case 0:
                    VStack(spacing: 0) {
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 30, height: 5)
                                .foregroundStyle(Color.JJTitle)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 30, height: 5)
                                .foregroundStyle(.gray.opacity(0.5))
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 30, height: 5)
                                .foregroundStyle(.gray.opacity(0.5))
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 30, height: 5)
                                .foregroundStyle(.gray.opacity(0.5))
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 30, height: 5)
                                .foregroundStyle(.gray.opacity(0.5))
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                        
                        // MARK: -- 자기 소개
                        VStack {
                            HStack {
                                Text("자기 소개")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            TextField("자기 소개를 입력해 주세요.", text: $viewModel.inputIntroduction, axis: .vertical)
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
                        .padding(.bottom, 30)
                        
                        // MARK: -- 지역
                        VStack {
                            HStack {
                                Text("지역")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Menu {
                                Button {
                                    viewModel.selectedRegion = Region.seoul.rawValue
                                } label: {
                                    Text(Region.seoul.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.incheon.rawValue
                                } label: {
                                    Text(Region.incheon.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.gyeonggi.rawValue
                                } label: {
                                    Text(Region.gyeonggi.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.busan.rawValue
                                } label: {
                                    Text(Region.busan.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.ulsan.rawValue
                                } label: {
                                    Text(Region.ulsan.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.gyeongnam.rawValue
                                } label: {
                                    Text(Region.gyeongnam.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.daegu.rawValue
                                } label: {
                                    Text(Region.daegu.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.gyeongbuk.rawValue
                                } label: {
                                    Text(Region.gyeongbuk.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.daejeon.rawValue
                                } label: {
                                    Text(Region.daejeon.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.sejong.rawValue
                                } label: {
                                    Text(Region.sejong.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.chungnam.rawValue
                                } label: {
                                    Text(Region.chungnam.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.chungbuk.rawValue
                                } label: {
                                    Text(Region.chungbuk.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.gwangju.rawValue
                                } label: {
                                    Text(Region.gwangju.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.jeonnam.rawValue
                                } label: {
                                    Text(Region.jeonnam.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.jeonbuk.rawValue
                                } label: {
                                    Text(Region.jeonbuk.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.gangwon.rawValue
                                } label: {
                                    Text(Region.gangwon.rawValue)
                                }
                                
                                Button {
                                    viewModel.selectedRegion = Region.jeju.rawValue
                                } label: {
                                    Text(Region.jeju.rawValue)
                                }
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 20)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                            .padding(.horizontal, 20)
                                    }
                                    .overlay {
                                        HStack {
                                            Text(viewModel.selectedRegion.isEmpty ? "지역을 선택해 주세요." : viewModel.selectedRegion)
                                                .font(.pretendard(size: 14))
                                                .foregroundStyle(viewModel.selectedRegion.isEmpty ? .gray.opacity(0.55) : .black)
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
                        .padding(.bottom, 30)
                        
                        // MARK: -- 전문 분야
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
                                    Text(SkillCategory.management.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .consulting
                                } label: {
                                    Text(SkillCategory.consulting.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .marketing
                                } label: {
                                    Text(SkillCategory.marketing.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .development
                                } label: {
                                    Text(SkillCategory.development.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .design
                                } label: {
                                    Text(SkillCategory.design.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .writing
                                } label: {
                                    Text(SkillCategory.writing.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .translation
                                } label: {
                                    Text(SkillCategory.translation.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .media
                                } label: {
                                    Text(SkillCategory.media.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .education
                                } label: {
                                    Text(SkillCategory.education.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .customMade
                                } label: {
                                    Text(SkillCategory.customMade.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .hobbyLesson
                                } label: {
                                    Text(SkillCategory.hobbyLesson.text)
                                }
                                
                                Button {
                                    viewModel.selectedSkill = .lifeService
                                } label: {
                                    Text(SkillCategory.lifeService.text)
                                }
                                
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 20)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                            .padding(.horizontal, 20)
                                    }
                                    .overlay {
                                        HStack {
                                            Text(viewModel.selectedSkill?.text ?? "전문 분야를 선택해 주세요.")
                                                .font(.pretendard(size: 14))
                                                .foregroundStyle(viewModel.selectedSkill == nil ? .gray.opacity(0.55) : .black)
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
                    
                    // MARK: Page Index 1
                case 1:
                    VStack(spacing: 0) {
                        ScrollView {
                            VStack(spacing: 0) {
                                HStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(.gray.opacity(0.5))
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(.gray.opacity(0.5))
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(.gray.opacity(0.5))
                                }
                                .padding(.top, 10)
                                .padding(.bottom, 20)
                                
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
                                                    .foregroundStyle(.gray.opacity(0.8))
                                                    .padding(.leading, 20)
                                                    .padding(.bottom, 8)
                                                
                                                Spacer()
                                            }
                                        }
                                        
                                        ScrollView(.horizontal) {
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
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .foregroundStyle(.red.opacity(0.1))
                                                            .overlay {
                                                                RoundedRectangle(cornerRadius: 20)
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
                                    ForEach(Array(SkillCategory.allCases.enumerated()), id: \.element) { index, currentSkill in
                                        HStack {
                                            Text(currentSkill.text)
                                                .font(.pretendard(Pretendard.regular, size: 18))
                                                .padding(.leading, 20)
                                            
                                            Spacer()
                                        }
                                        .padding(.vertical, 20)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            viewModel.tappedSkillForSheet = currentSkill
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
                        viewModel.tappedSkillForSheet = nil
                    } content: {
                        ProviderProfileSkillDetailSheetView(selectedDetailSkillIds: $viewModel.selectedDetailSkillIds, targetSkill: viewModel.tappedSkillForSheet)
                            .presentationDragIndicator(.visible)
                            .presentationDetents([.medium, .large])
                    }
                    
                    // MARK: Page Index 2
                case 2:
                    VStack(spacing: 0) {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 0) {
                                HStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(.gray.opacity(0.5))
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(.gray.opacity(0.5))
                                }
                                .padding(.top, 10)
                                .padding(.bottom, 20)
                                
                                // MARK: -- 경력
                                VStack(spacing: 5) {
                                    HStack {
                                        Text("경력")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    VStack(spacing: 15) {
                                        ForEach($viewModel.careerFormList) { $careerForm in
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(height: 390)
                                                .foregroundStyle(.gray.opacity(0.1))
                                                .padding(.horizontal, 20)
                                                .overlay {
                                                    VStack(spacing: 25) {
                                                        VStack {
                                                            HStack {
                                                                Text("단체명")
                                                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                                                    .padding(.leading, 30)
                                                                
                                                                Spacer()
                                                            }
                                                            
                                                            HStack {
                                                                TextField("단체명을 입력해 주세요", text: $careerForm.groupName)
                                                                //                                                        .focused($focus, equals: .first)
                                                                    .font(.pretendard(size: 14))
                                                                    .padding(.horizontal)
                                                                    .frame(height: 45)
                                                                    .background(.white)
                                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                    .overlay {
                                                                        RoundedRectangle(cornerRadius: 10)
                                                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                                                    }
                                                            }
                                                            .padding(.horizontal, 30)
                                                        }
                                                        
                                                        VStack {
                                                            HStack {
                                                                Text("직책/역할")
                                                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                                                    .padding(.leading, 30)
                                                                
                                                                Spacer()
                                                            }
                                                            
                                                            HStack {
                                                                TextField("직책이나 역할을 입력해 주세요", text: $careerForm.role)
                                                                //                                                        .focused($focus, equals: .first)
                                                                    .font(.pretendard(size: 14))
                                                                    .padding(.horizontal)
                                                                    .frame(height: 45)
                                                                    .background(.white)
                                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                    .overlay {
                                                                        RoundedRectangle(cornerRadius: 10)
                                                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                                                    }
                                                            }
                                                            .padding(.horizontal, 30)
                                                        }
                                                        
                                                        VStack {
                                                            HStack {
                                                                Text("증빙 자료")
                                                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                                                    .padding(.leading, 30)
                                                                
                                                                Spacer()
                                                            }
                                                            
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                                                                .frame(height: 100)
                                                                .padding(.horizontal, 30)
                                                                .overlay {
                                                                    VStack(spacing: 5) {
                                                                        Image(systemName: "folder.badge.plus")
                                                                            .font(.system(size: 22))
                                                                            .foregroundStyle(.gray.opacity(0.5))
                                                                        
                                                                        Text("탭하여 파일 불러오기")
                                                                            .font(.pretendard(Pretendard.medium, size: 14))
                                                                            .foregroundStyle(.gray.opacity(0.5))
                                                                    }
                                                                }
                                                        }
                                                    }
                                                }
                                                .overlay {
                                                    VStack {
                                                        HStack {
                                                            Spacer()
                                                            
                                                            Button {
                                                                withAnimation(.customAnimation) {
                                                                    viewModel.removeCurrentCareerForm($careerForm.wrappedValue)
                                                                }
                                                            } label: {
                                                                Image(systemName: "xmark")
                                                                    .font(.system(size: 15))
                                                                    .foregroundStyle(.gray.opacity(0.5))
                                                                    .padding(.trailing, 35)
                                                            }
                                                        }
                                                        .padding(.top, 12)
                                                        
                                                        Spacer()
                                                    }
                                                }
                                        }
                                    }
                                    .padding(.bottom, 5)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 80)
                                        .foregroundStyle(.gray.opacity(0.1))
                                        .padding(.horizontal, 20)
                                        .overlay {
                                            HStack {
                                                Image(systemName: "plus.app")
                                                    .font(.system(size: 16))
                                                    .foregroundStyle(.gray.opacity(0.8))
                                                
                                                Text("경력 추가")
                                                    .font(.pretendard(Pretendard.regular, size: 16))
                                                    .foregroundStyle(.gray.opacity(0.8))
                                            }
                                        }
                                        .onTapGesture {
                                            withAnimation(.customAnimation) {
                                                viewModel.careerFormList.append(CareerForm())
                                            }
                                        }
                                }
                            }
                        }
                    }
                    
                    // MARK: Page Index 3
                case 3:
                    VStack(spacing: 0) {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 0) {
                                HStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(.gray.opacity(0.5))
                                }
                                .padding(.top, 10)
                                .padding(.bottom, 20)
                                
                                // MARK: -- 학력
                                VStack(spacing: 5) {
                                    HStack {
                                        Text("학력")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    VStack(spacing: 15) {
                                        ForEach($viewModel.degreeFormList) { $degreeForm in
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(height: 500)
                                                .foregroundStyle(.gray.opacity(0.1))
                                                .padding(.horizontal, 20)
                                                .overlay {
                                                    VStack(spacing: 25) {
                                                        VStack {
                                                            HStack {
                                                                Text("학교명")
                                                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                                                    .padding(.leading, 30)
                                                                
                                                                Spacer()
                                                            }
                                                            
                                                            HStack {
                                                                TextField("학교명을 입력해 주세요", text: $degreeForm.schoolName)
                                                                //                                                        .focused($focus, equals: .first)
                                                                    .font(.pretendard(size: 14))
                                                                    .padding(.horizontal)
                                                                    .frame(height: 45)
                                                                    .background(.white)
                                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                    .overlay {
                                                                        RoundedRectangle(cornerRadius: 10)
                                                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                                                    }
                                                            }
                                                            .padding(.horizontal, 30)
                                                        }
                                                        
                                                        VStack {
                                                            HStack {
                                                                Text("전공")
                                                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                                                    .padding(.leading, 30)
                                                                
                                                                Spacer()
                                                            }
                                                            
                                                            HStack {
                                                                TextField("전공을 입력해 주세요", text: $degreeForm.major)
                                                                //                                                        .focused($focus, equals: .first)
                                                                    .font(.pretendard(size: 14))
                                                                    .padding(.horizontal)
                                                                    .frame(height: 45)
                                                                    .background(.white)
                                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                    .overlay {
                                                                        RoundedRectangle(cornerRadius: 10)
                                                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                                                    }
                                                            }
                                                            .padding(.horizontal, 30)
                                                        }
                                                        
                                                        VStack {
                                                            HStack {
                                                                Text("학위")
                                                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                                                    .padding(.leading, 30)
                                                                
                                                                Spacer()
                                                            }
                                                            
                                                            Menu {
                                                                Button {
                                                                    $degreeForm.degree.wrappedValue = "학사"
                                                                } label: {
                                                                    Text("학사")
                                                                }
                                                                
                                                                Button {
                                                                    $degreeForm.degree.wrappedValue = "석사"
                                                                } label: {
                                                                    Text("석사")
                                                                }
                                                                
                                                                Button {
                                                                    $degreeForm.degree.wrappedValue = "박사"
                                                                } label: {
                                                                    Text("박사")
                                                                }
                                                            } label: {
                                                                HStack {
                                                                    RoundedRectangle(cornerRadius: 10)
                                                                        .frame(height: 45)
                                                                        .padding(.horizontal)
                                                                        .foregroundStyle(.white)
                                                                        .overlay {
                                                                            RoundedRectangle(cornerRadius: 10)
                                                                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                                                                                .padding(.horizontal)
                                                                        }
                                                                        .overlay {
                                                                            HStack {
                                                                                Text("학위를 선택해 주세요")
                                                                                    .font(.pretendard(size: 14))
                                                                                    .foregroundStyle(.gray.opacity(0.55))
                                                                                    .padding(.leading, 30)
                                                                                
                                                                                Spacer()
                                                                                
                                                                                Image(systemName: "chevron.up.chevron.down")
                                                                                    .font(.system(size: 14.5))
                                                                                    .foregroundStyle(.gray.opacity(0.55))
                                                                                    .padding(.trailing, 30)
                                                                            }
                                                                        }
                                                                }
                                                                .padding(.horizontal, 14)
                                                            }
                                                        }
                                                        
                                                        VStack {
                                                            HStack {
                                                                Text("증빙 자료")
                                                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                                                    .padding(.leading, 30)
                                                                
                                                                Spacer()
                                                            }
                                                            
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                                                                .frame(height: 100)
                                                                .padding(.horizontal, 30)
                                                                .overlay {
                                                                    VStack(spacing: 5) {
                                                                        Image(systemName: "folder.badge.plus")
                                                                            .font(.system(size: 22))
                                                                            .foregroundStyle(.gray.opacity(0.5))
                                                                        
                                                                        Text("탭하여 파일 불러오기")
                                                                            .font(.pretendard(Pretendard.medium, size: 14))
                                                                            .foregroundStyle(.gray.opacity(0.5))
                                                                    }
                                                                }
                                                        }
                                                    }
                                                }
                                                .overlay {
                                                    VStack {
                                                        HStack {
                                                            Spacer()
                                                            
                                                            Button {
                                                                withAnimation(.customAnimation) {
                                                                    viewModel.removeCurrentDegreeForm($degreeForm.wrappedValue)
                                                                }
                                                            } label: {
                                                                Image(systemName: "xmark")
                                                                    .font(.system(size: 15))
                                                                    .foregroundStyle(.gray.opacity(0.5))
                                                                    .padding(.trailing, 35)
                                                            }
                                                        }
                                                        .padding(.top, 12)
                                                        
                                                        Spacer()
                                                    }
                                                }
                                        }
                                    }
                                    .padding(.bottom, 5)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 80)
                                        .foregroundStyle(.gray.opacity(0.1))
                                        .padding(.horizontal, 20)
                                        .overlay {
                                            HStack {
                                                Image(systemName: "plus.app")
                                                    .font(.system(size: 16))
                                                    .foregroundStyle(.gray.opacity(0.8))
                                                
                                                Text("학력 추가")
                                                    .font(.pretendard(Pretendard.regular, size: 16))
                                                    .foregroundStyle(.gray.opacity(0.8))
                                            }
                                        }
                                        .onTapGesture {
                                            withAnimation(.customAnimation) {
                                                viewModel.degreeFormList.append(DegreeForm())
                                            }
                                        }
                                }
                                .padding(.bottom, 30)
                                
                                // MARK: -- 자격증
                                VStack(spacing: 5) {
                                    HStack {
                                        Text("자격증")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    
                                    VStack(spacing: 15) {
                                        ForEach($viewModel.certificateFormList) { $certificateForm in
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(height: 290)
                                                .foregroundStyle(.gray.opacity(0.1))
                                                .padding(.horizontal, 20)
                                                .overlay {
                                                    VStack(spacing: 25) {
                                                        VStack {
                                                            HStack {
                                                                Text("자격증 이름")
                                                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                                                    .padding(.leading, 30)
                                                                
                                                                Spacer()
                                                            }
                                                            
                                                            HStack {
                                                                TextField("자격증 이름을 입력해 주세요", text: $certificateForm.certificateName)
                                                                //                                                            .focused($focus, equals: .first)
                                                                    .font(.pretendard(size: 14))
                                                                    .padding(.horizontal)
                                                                    .frame(height: 45)
                                                                    .background(.white)
                                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                    .overlay {
                                                                        RoundedRectangle(cornerRadius: 10)
                                                                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                                                                    }
                                                            }
                                                            .padding(.horizontal, 30)
                                                        }
                                                        
                                                        VStack {
                                                            HStack {
                                                                Text("증빙 자료")
                                                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                                                    .padding(.leading, 30)
                                                                
                                                                Spacer()
                                                            }
                                                            
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                                                                .frame(height: 100)
                                                                .padding(.horizontal, 30)
                                                                .overlay {
                                                                    VStack(spacing: 5) {
                                                                        Image(systemName: "folder.badge.plus")
                                                                            .font(.system(size: 22))
                                                                            .foregroundStyle(.gray.opacity(0.5))
                                                                        
                                                                        Text("탭하여 파일 불러오기")
                                                                            .font(.pretendard(Pretendard.medium, size: 14))
                                                                            .foregroundStyle(.gray.opacity(0.5))
                                                                    }
                                                                }
                                                        }
                                                    }
                                                }
                                                .overlay {
                                                    VStack {
                                                        HStack {
                                                            Spacer()
                                                            
                                                            Button {
                                                                withAnimation(.customAnimation) {
                                                                    viewModel.removeCurrentCertificateForm($certificateForm.wrappedValue)
                                                                }
                                                            } label: {
                                                                Image(systemName: "xmark")
                                                                    .font(.system(size: 15))
                                                                    .foregroundStyle(.gray.opacity(0.5))
                                                                    .padding(.trailing, 35)
                                                            }
                                                        }
                                                        .padding(.top, 12)
                                                        
                                                        Spacer()
                                                    }
                                                }
                                        }
                                    }
                                    .padding(.bottom, 5)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 80)
                                        .foregroundStyle(.gray.opacity(0.1))
                                        .padding(.horizontal, 20)
                                        .overlay {
                                            HStack {
                                                Image(systemName: "plus.app")
                                                    .font(.system(size: 16))
                                                    .foregroundStyle(.gray.opacity(0.8))
                                                
                                                Text("자격증 추가")
                                                    .font(.pretendard(Pretendard.regular, size: 16))
                                                    .foregroundStyle(.gray.opacity(0.8))
                                            }
                                        }
                                        .onTapGesture {
                                            withAnimation(.customAnimation) {
                                                viewModel.certificateFormList.append(CertificateForm())
                                            }
                                        }
                                }
                            }
                        }
                    }
                    
                    // MARK: Page Index 4
                case 4:
                    VStack(spacing: 0) {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 0) {
                                HStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 30, height: 5)
                                        .foregroundStyle(Color.JJTitle)
                                }
                                .padding(.top, 10)
                                .padding(.bottom, 20)
                                
                                VStack(spacing: 5) {
                                    HStack {
                                        Text("시간대")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .padding(.leading, 20)
                                        
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                    
                                    Text("\(viewModel.convertTimeTo24(viewModel.startTime)) – \(viewModel.convertTimeTo24(viewModel.endTime))")
                                        .font(.pretendard(Pretendard.medium, size: 16))
                                    
                                    RangeSlider(lowerValue: $viewModel.startTime,
                                                upperValue: $viewModel.endTime,
                                                step: viewModel.hourStep)
                                    .accentColor(Color.JJTitle)
                                    .frame(height: 60)
                                    .padding(.horizontal, 30)
                                    
                                }
                            }
                        }
                    }
                    
                default:
                    VStack {}
                }
                
                VStack {}
                    .frame(width: 1, height: 90)
            }
            .padding(.top, 1)
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
                                .opacity(viewModel.isAllValidatedInPageIndex0 ? 1 : 0.4)
                                .disabled(!viewModel.isAllValidatedInPageIndex0)
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
                                    .opacity(viewModel.isAllValidatedInPageIndex1 ? 1 : 0.4)
                                    .disabled(!viewModel.isAllValidatedInPageIndex1)
                            }
                        }
                        
                    case 2:
                        HStack(spacing: 15) {
                            Button {
                                viewModel.pageIndex = 1
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
                                viewModel.pageIndex = 3
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
//                                    .opacity(viewModel.isAllValidatedInPageIndex1 ? 1 : 0.4)
//                                    .disabled(!viewModel.isAllValidatedInPageIndex1)
                            }
                        }
                        
                    case 3:
                        HStack(spacing: 15) {
                            Button {
                                viewModel.pageIndex = 2
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
                                viewModel.pageIndex = 4
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
//                                    .opacity(viewModel.isAllValidatedInPageIndex1 ? 1 : 0.4)
//                                    .disabled(!viewModel.isAllValidatedInPageIndex1)
                            }
                        }
                        
                    case 4:
                        HStack(spacing: 15) {
                            Button {
                                viewModel.pageIndex = 3
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
                                if viewModel.isUpdatePrividerCompleted {
                                    viewModel.updateProviderInfo()
                                    isNeedUserInfoLoadCapsule.isNeedUserInfoLoad = true
                                } else {
                                    viewModel.registerProviderInfo()
                                    isNeedUserInfoLoadCapsule.isNeedUserInfoLoad = true
                                }
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 45)
                                    .foregroundStyle(Color.JJTitle)
                                    .overlay {
                                        Text("완료")
                                            .font(.pretendard(Pretendard.semiBold, size: 17))
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.trailing, 20)
//                                    .opacity(viewModel.isAllValidatedInPageIndex1 ? 1 : 0.4)
//                                    .disabled(!viewModel.isAllValidatedInPageIndex1)
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
        .onChange(of: viewModel.isUpdatePrividerCompleted) { _, isUpdatePrividerCompleted in
            if isUpdatePrividerCompleted {
                navRouter.popToRoot()
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditProviderProfileView()
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
