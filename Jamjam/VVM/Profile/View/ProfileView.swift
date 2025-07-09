//
//  ProfileView.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        Text("프로필")
                            .font(.pretendard(Pretendard.semiBold, size: 25))
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                }
                .frame(height: 50)
                .background(Color.mainBackground)
            }
            
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack {
                        HStack {
                            AsyncImage(url: URL(string: viewModel.user?.profileUrl ?? "")) { state in
                                switch state {
                                case .empty:
                                    Circle()
                                        .scaledToFit()
                                        .frame(width: 80)
                                        .foregroundStyle(.gray.opacity(0.5))
                                        .overlay {
                                            Image(systemName: "person")
                                                .font(.system(size: 20))
                                                .foregroundStyle(.gray)
                                        }
                                    
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80)
                                        .clipShape(Circle())
                                    
                                case .failure:
                                    Circle()
                                        .scaledToFit()
                                        .frame(width: 80)
                                        .foregroundStyle(.gray.opacity(0.5))
                                    
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .padding(.leading)
                            
                            VStack(alignment: .leading, spacing: 7) {
                                Text(viewModel.user?.nickname ?? "닉네임")
                                    .font(.pretendard(Pretendard.semiBold, size: 20))
                                
                                HStack {
                                    Text(viewModel.user?.role == .provider ? "전문가" : "고객")
                                        .font(.pretendard(Pretendard.medium, size: 15))
                                        .foregroundStyle(.white)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.JJTitle)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                            .padding(.leading)
                            
                            Spacer()
                        }
                        .padding(.top, 10)
                        .padding(.bottom)
                        
                        HStack {
                            HStack {
                                Text("보유 크레딧")
                                    .font(.pretendard(Pretendard.medium, size: 17))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 40)
                                
                                Spacer()
                                
                                Text("\(viewModel.user?.credit ?? 1000)원")
                                    .font(.pretendard(Pretendard.semiBold, size: 17))
                                    .foregroundStyle(.white)
                                    .padding(.trailing, 40)
                            }
                        }
                        .frame(maxWidth:. infinity)
                        .frame(height: 50)
                        .background(Color.JJTitle)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.gray.opacity(0.1))
                    .frame(height: 190)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                    
                    VStack(spacing: 17) {
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "info.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading, 20)
                                
                                Text("기본 정보 수정")
                                    .font(.pretendard(size: 16))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 20)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        Button {
                            navRouter.navigate(.providerProfileEditView)
                        } label: {
                            HStack {
                                Image(systemName: "person.text.rectangle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading, 20)
                                
                                Text("전문가 프로필 수정")
                                    .font(.pretendard(size: 16))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 20)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "list.bullet")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading, 20)
                                
                                Text("서비스 관리")
                                    .font(.pretendard(size: 16))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 20)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "dollarsign.arrow.trianglehead.counterclockwise.rotate.90")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading, 20)
                                
                                Text("수익 관리")
                                    .font(.pretendard(size: 16))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 20)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        Divider()
                            .padding(.horizontal, 20)
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "bell")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading, 20)
                                
                                Text("알림 설정")
                                    .font(.pretendard(size: 16))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .padding(.trailing, 20)
                            }
                            .foregroundStyle(.black)
                        }
                    }
                }

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .onAppear {
            if !viewModel.isUserInit {
                viewModel.fetchUser()
                viewModel.isUserInit = true
            }
        }
    }
    
    
}

#Preview {
    ProfileView()
        .environment(NavigationCore())
}
