//
//  SignUpView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        MainBackground {
            ScrollView(showsIndicators: false) {
                VStack {
                    Image("jamjam_main_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90)
                        .padding(.top, 50)
                        .padding(.bottom, 30)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                    
                    Text("잼잼에 오신 걸 환영해요.\n어떤 역할로 함께 하시겠어요?")
                        .font(.system(size: 23))
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.white)
                            .scaledToFit()
                            .frame(height: 230)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                            .overlay {
                                VStack(alignment: .leading) {
                                    Image(systemName: "apple.writing.tools")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .foregroundStyle(Color.JJTitle)
                                        .padding(.bottom)
                                    
                                    Text("경험을 나누고 싶은 분")
                                        .font(.system(size: 19))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.black)
                                        .padding(.bottom, 15)
                                    
                                    Text("내가 잘해온 분야를 살려\n서비스를 등록하고 활동하고 싶어요.")
                                        .font(.system(size: 11))
                                        .foregroundStyle(.gray)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .padding(.horizontal, 60)
                    }
                    .padding(.bottom, 10)
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.white)
                            .scaledToFit()
                            .frame(height: 230)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                            .overlay {
                                VStack(alignment: .leading) {
                                    Image(systemName: "personalhotspot")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .foregroundStyle(Color.JJTitle)
                                        .padding(.bottom, 10)
                                    
                                    Text("도움을 받고 싶은 분")
                                        .font(.system(size: 19))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.black)
                                        .padding(.bottom, 10)
                                    
                                    Text("지금 필요한 일에\n경험 있는 분의 손길을 받아보고 싶어요.")
                                        .font(.system(size: 11))
                                        .foregroundStyle(.gray)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .padding(.horizontal, 60)
                    }
                    
                    VStack {
                        
                    }
                    .frame(height: 50)
                }
            }
            .modifier(NavigationBackAndTitleModifier(title: "회원 가입"))
        }
    }
}

#Preview {
    SignUpView()
        .environment(NavigationRouter())
}
