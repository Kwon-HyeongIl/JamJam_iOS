//
//  ProviderProfileEditListView.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import SwiftUI

struct ProviderProfileEditListView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State var viewModel = ProviderProfileEditViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    Button {
                        navRouter.navigate(.providerProfileIntroductionEditView(viewModel))
                    } label: {
                        HStack {
                            Image(systemName: "person")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.JJTitle)
                                .padding(.leading, 20)
                            
                            Text("전문가 소개")
                                .font(.pretendard(Pretendard.regular, size: 17))
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 17))
                                .foregroundStyle(.gray)
                                .padding(.trailing, 20)
                        }
                    }
                    .padding(.top)
                    
                    Divider()
                        .padding(.horizontal, 20)
                    
                    Button {
                        navRouter.navigate(.providerProfileSkillEditView(viewModel))
                    } label: {
                        HStack {
                            Image(systemName: "wrench.and.screwdriver")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.JJTitle)
                                .padding(.leading, 20)
                            
                            Text("보유 기술")
                                .font(.pretendard(Pretendard.regular, size: 17))
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 17))
                                .foregroundStyle(.gray)
                                .padding(.trailing, 20)
                        }
                    }
                    
                    Divider()
                        .padding(.horizontal, 20)
                    
                    Button {
                        navRouter.navigate(.providerProfileCareerEditView(viewModel))
                    } label: {
                        HStack {
                            Image(systemName: "building.2")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.JJTitle)
                                .padding(.leading, 20)
                            
                            Text("경력 사항")
                                .font(.pretendard(Pretendard.regular, size: 17))
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 17))
                                .foregroundStyle(.gray)
                                .padding(.trailing, 20)
                        }
                    }
                    
                    Divider()
                        .padding(.horizontal, 20)
                    
                    Button {
                        navRouter.navigate(.providerProfileCertificationEditView(viewModel))
                    } label: {
                        HStack {
                            Image(systemName: "person.text.rectangle")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.JJTitle)
                                .padding(.leading, 20)
                            
                            Text("학력 및 자격증")
                                .font(.pretendard(Pretendard.regular, size: 17))
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 17))
                                .foregroundStyle(.gray)
                                .padding(.trailing, 20)
                        }
                    }
                    
                    Divider()
                        .padding(.horizontal, 20)
                    
                    Button {
                        navRouter.navigate(.providerProfileCallTimeEditView(viewModel))
                    } label: {
                        HStack {
                            Image(systemName: "clock.arrow.trianglehead.2.counterclockwise.rotate.90")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.JJTitle)
                                .padding(.leading, 20)
                            
                            Text("연락 가능 시간")
                                .font(.pretendard(Pretendard.regular, size: 17))
                                .foregroundStyle(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 17))
                                .foregroundStyle(.gray)
                                .padding(.trailing, 20)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleModifier(title: "프로필 수정"))
    }
}

#Preview {
    NavigationStack {
        ProviderProfileEditListView()
            .environment(NavigationRouter())
    }
}
