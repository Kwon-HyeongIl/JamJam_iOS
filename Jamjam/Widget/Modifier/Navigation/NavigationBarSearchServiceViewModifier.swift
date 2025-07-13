//
//  NavigationBarSearchServiceViewModifier.swift
//  Jamjam
//
//  Created by 권형일 on 7/13/25.
//

import SwiftUI

struct NavigationBarSearchServiceViewModifier: ViewModifier {
    @Environment(NavigationCore.self) var navRouter
    
    @Binding var searchText: String
    @Binding var searchButtonTapped: Bool
    var isEntireProgressVisible: Binding<Bool>?
    
    init(searchText: Binding<String>, searchButtonTapped: Binding<Bool>,  isEntireProgressVisible: Binding<Bool>? = nil) {
        self._searchText = searchText
        self._searchButtonTapped = searchButtonTapped
        self.isEntireProgressVisible = isEntireProgressVisible
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.mainBackground)
        appearance.shadowColor = .clear // 하단 Divider 제거
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground((isEntireProgressVisible?.wrappedValue ?? false) ? .clear : Color.mainBackground, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        navRouter.back()
                    } label: {
                        Image(systemName: "chevron.left")
                            .scaledToFit()
                            .frame(width: 24)
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                            .blur(radius: (isEntireProgressVisible?.wrappedValue ?? false) ? 2.0 : 0)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    TextField("검색할 내용을 입력해 주세요.", text: $searchText)
                        .font(.pretendard(size: 14))
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray.opacity(0.2), lineWidth: 1)
                        }
                        .submitLabel(.search)
                        .onSubmit {
                            searchButtonTapped = true
                        }
                        .blur(radius: (isEntireProgressVisible?.wrappedValue ?? false) ? 2.0 : 0)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        searchButtonTapped = true
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .scaledToFit()
                            .font(.system(size: 20))
                            .foregroundStyle(Color.JJTitle)
                            .blur(radius: (isEntireProgressVisible?.wrappedValue ?? false) ? 2.0 : 0)
                    }
                }
            }
    }
}
