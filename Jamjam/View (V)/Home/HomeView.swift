//
//  HomeView.swift
//  Jamjam
//
//  Created by 권형일 on 6/12/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("logo")
                        .padding(.leading)
                    
                    Spacer()
                }
            }
            .frame(height: 100)
            .background(.white)
            
            ScrollView {
                VStack {
                    HStack {
                        Text("경험이 있는 손,\n지금 필요한 일에 연결해보세요")
                            .font(.system(size: 23))
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding(.top)
                            .padding(.leading, 35)
                        
                        Spacer()
                    }
                    
                    Button {
                        // navigate searching view
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 42)
                            .padding(.horizontal, 35)
                            .foregroundStyle(.white)
                            .overlay {
                                HStack {
                                    Text("필요한 손길을 찾아보세요")
                                        .font(.system(size: 12))
                                        .foregroundStyle(.gray)
                                        .padding(.leading)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15)
                                        .foregroundStyle(.gray)
                                        .padding(.trailing)
                                }
                                .padding(.horizontal, 35)
                            }
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                    }
                }
            }
        }
        .background(.gray.opacity(0.15))
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    HomeView()
}
