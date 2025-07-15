//
//  SearchView.swift
//  Jamjam
//
//  Created by 권형일 on 6/13/25.
//

import SwiftUI

struct SearchServiceView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel = SearchServiceViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                ScrollView {
                    LazyVGrid(columns: viewModel.columns, spacing: 10) {
                        ForEach(viewModel.services, id: \.serviceId) { service in
                            ServiceCellView(service: service, upperWidth: proxy.size.width)
                                .onTapGesture {
                                    navRouter.navigate(.serviceView(service.serviceId))
                                }
                                .onAppear {
                                    if service.serviceId == viewModel.services.last?.serviceId {
                                        viewModel.searchService()
                                    }
                                }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 10)
                }
                .padding(.top, 1)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.mainBackground)
            .modifier(NavigationBarSearchServiceViewModifier(searchText: $viewModel.searchText, searchButtonTapped: $viewModel.isSearchButtonTapped, isEntireProgressVisible: $viewModel.isEntireProgressVisible))
            .onChange(of: viewModel.isSearchButtonTapped) { _, isSearchButtonTapped in
                if isSearchButtonTapped {
                    viewModel.restoreServices()
                    viewModel.searchService()
                    viewModel.isSearchButtonTapped = false
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SearchServiceView()
            .environment(NavigationCore())
    }
}
