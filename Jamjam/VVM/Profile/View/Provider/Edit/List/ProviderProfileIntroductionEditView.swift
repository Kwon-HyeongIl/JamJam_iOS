//
//  ProviderProfileIntroductionEditView.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import SwiftUI

struct ProviderProfileIntroductionEditView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: ProviderProfileEditViewModel
    
    @FocusState private var focus: TextFieldFocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
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
                                viewModel.selectedRegion = .region1
                            } label: {
                                Text(Region.region1.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region2
                            } label: {
                                Text(Region.region2.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region3
                            } label: {
                                Text(Region.region3.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region4
                            } label: {
                                Text(Region.region4.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region5
                            } label: {
                                Text(Region.region5.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region6
                            } label: {
                                Text(Region.region6.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region7
                            } label: {
                                Text(Region.region7.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region8
                            } label: {
                                Text(Region.region8.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region9
                            } label: {
                                Text(Region.region9.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region10
                            } label: {
                                Text(Region.region10.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region11
                            } label: {
                                Text(Region.region11.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region12
                            } label: {
                                Text(Region.region12.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region13
                            } label: {
                                Text(Region.region13.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region14
                            } label: {
                                Text(Region.region14.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region15
                            } label: {
                                Text(Region.region15.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region16
                            } label: {
                                Text(Region.region16.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedRegion = .region17
                            } label: {
                                Text(Region.region17.rawValue)
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
                                        Text(viewModel.selectedRegion.rawValue)
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
                                viewModel.selectedSkill = .skill1
                            } label: {
                                Text(Skill.skill1.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedSkill = .skill2
                            } label: {
                                Text(Skill.skill2.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedSkill = .skill3
                            } label: {
                                Text(Skill.skill3.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedSkill = .skill4
                            } label: {
                                Text(Skill.skill4.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedSkill = .skill5
                            } label: {
                                Text(Skill.skill5.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedSkill = .skill6
                            } label: {
                                Text(Skill.skill6.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedSkill = .skill7
                            } label: {
                                Text(Skill.skill7.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedSkill = .skill8
                            } label: {
                                Text(Skill.skill8.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedSkill = .skill9
                            } label: {
                                Text(Skill.skill9.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedSkill = .skill10
                            } label: {
                                Text(Skill.skill10.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedSkill = .skill11
                            } label: {
                                Text(Skill.skill11.rawValue)
                            }
                            
                            Button {
                                viewModel.selectedSkill = .skill12
                            } label: {
                                Text(Skill.skill12.rawValue)
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
                                        Text(viewModel.selectedSkill.rawValue)
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
            }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0) {
                    Divider()
                    
                    Spacer()
                    
                    Button {
                        // 저장 함수 호출
                        navRouter.back()
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 45)
                            .foregroundStyle(Color.JJTitle)
                            .padding(.horizontal, 20)
                            .overlay {
                                Text("저장")
                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                    .foregroundStyle(.white)
                            }
                    }
                    
                    Spacer()
                }
                .frame(height: 70)
                .background(Color.mainBackground)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleModifier(title: "전문가 소개"))
        .onTapGesture {
            focus = nil
        }
    }
}

#Preview {
    NavigationStack {
        ProviderProfileIntroductionEditView(viewModel: ProviderProfileEditViewModel())
            .environment(NavigationRouter())
    }
}
