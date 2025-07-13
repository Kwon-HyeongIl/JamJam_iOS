//
//  OrderServiceView.swift
//  Jamjam
//
//  Created by 권형일 on 7/12/25.
//

import SwiftUI

struct OrderServiceView: View {
    @Environment(NavigationCore.self) var navRouter
    @State private var viewModel: OrderServiceViewModel
    
    @FocusState private var focus: TextFieldFocusField?
    
    init(serviceCell: ServiceCellDomainModel?) {
        viewModel = OrderServiceViewModel(serviceCell: serviceCell)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 40) {
                    VStack {
                        HStack {
                            Text("주문 내역 확인")
                                .font(.pretendard(Pretendard.bold, size: 20))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        .padding(.top, 10)
                        
                        HStack(spacing: 15) {
                            AsyncImage(url: URL(string: viewModel.serviceCell?.thumbnailUrl ?? "")) { state in
                                switch state {
                                case .empty:
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.gray.opacity(0.5))
                                        .shimmering()
                                    
                                case .success(let image):
                                    image
                                        .resizable()
                                    
                                case .failure:
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.gray.opacity(0.5))
                                    
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.leading, 10)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(viewModel.serviceCell?.serviceName ?? "서비스 이름")
                                    .font(.pretendard(Pretendard.semiBold, size: 16))
                                
                                Text("\(viewModel.serviceCell?.salary ?? 10000)원")
                                    .font(.pretendard(Pretendard.semiBold, size: 14))
                            }
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 20)
                    }
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("서비스 의뢰서 작성")
                                .font(.pretendard(Pretendard.bold, size: 20))
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        VStack(spacing: 30) {
                            // MARK: 제목
                            VStack {
                                HStack {
                                    Text("제목")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                
                                TextField("제목을 입력해 주세요.", text: $viewModel.title)
                                    .focused($focus, equals: .first)
                                    .font(.pretendard(size: 14))
                                    .padding(.horizontal)
                                    .frame(height: 45)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(focus == .first ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .first ? 1.5 : 1)
                                    }
                                    .padding(.horizontal, 20)
                            }
                            
                            // MARK: 마감일
                            VStack {
                                HStack {
                                    Text("마감일")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    TextField("년도", text: $viewModel.deadlineYear)
                                        .focused($focus, equals: .second)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 45)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .second ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .second ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.deadlineYear) { oldValue, newValue in
                                            if newValue.count > 4 {
                                                viewModel.deadlineYear = String(newValue.prefix(4))
                                            }
                                        }
                                    
                                    TextField("월", text: $viewModel.deadlineMonth)
                                        .focused($focus, equals: .third)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 45)
                                        .frame(maxWidth: 75)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .third ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .third ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.deadlineMonth) { oldValue, newValue in
                                            if newValue.count > 2 {
                                                viewModel.deadlineMonth = String(newValue.prefix(4))
                                            }
                                        }
                                        .onChange(of: focus) { oldValue, newValue in
                                            if newValue != .third && viewModel.deadlineMonth.count == 1 {
                                                viewModel.deadlineMonth = "0" + viewModel.deadlineMonth
                                            }
                                        }
                                    
                                    TextField("일", text: $viewModel.deadlineDay)
                                        .focused($focus, equals: .fourth)
                                        .font(.pretendard(size: 14))
                                        .padding(.horizontal)
                                        .frame(height: 45)
                                        .frame(maxWidth: 75)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(focus == .fourth ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .fourth ? 1.5 : 1)
                                        }
                                        .onChange(of: viewModel.deadlineDay) { oldValue, newValue in
                                            if newValue.count > 2 {
                                                viewModel.deadlineDay = String(newValue.prefix(4))
                                            }
                                        }
                                        .onChange(of: focus) { oldValue, newValue in
                                            if newValue != .fourth && viewModel.deadlineDay.count == 1 {
                                                viewModel.deadlineDay = "0" + viewModel.deadlineDay
                                            }
                                        }
                                }
                                .padding(.horizontal, 20)
                            }
                            
                            // MARK: 의뢰 내용
                            VStack {
                                HStack {
                                    Text("의뢰 내용")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                
                                TextField("의뢰 내용을 작성해 주세요.", text: $viewModel.orderDescription, axis: .vertical)
                                    .focused($focus, equals: .fifth)
                                    .font(.pretendard(size: 15))
                                    .lineLimit(1...15)
                                    .padding(.horizontal)
                                    .padding(.vertical, 10)
                                    .frame(minHeight: 200)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(focus == .fifth ? Color.JJTitle : .gray.opacity(0.2), lineWidth: focus == .fifth ? 1.5 : 1)
                                    }
                                    .padding(.horizontal, 20)
                            }
                            
                            // MARK: 참고 사진
                            VStack {
                                HStack {
                                    Text("참고 사진")
                                        .font(.pretendard(Pretendard.semiBold, size: 17))
                                        .padding(.leading, 20)
                                    
                                    Spacer()
                                }
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 150)
                                    .foregroundStyle(viewModel.selectedPortfolioImages.isEmpty ? .gray.opacity(0.1) : .clear)
                                    .padding(.horizontal, 20)
                                    .overlay {
                                        if viewModel.selectedPortfolioImages.isEmpty {
                                            VStack(spacing: 10) {
                                                Image(systemName: "photo")
                                                    .font(.system(size: 35))
                                                    .foregroundStyle(.gray.opacity(0.8))
                                                
                                                Text("탭하여 사진 불러오기")
                                                    .font(.pretendard(Pretendard.regular, size: 16))
                                                    .foregroundStyle(.gray.opacity(0.8))
                                            }
                                        }
                                    }
                                    .overlay {
                                        if let images = viewModel.portfolioImages {
                                            ScrollView(.horizontal) {
                                                HStack(spacing: 5) {
                                                    ForEach(Array(images.enumerated()), id: \.offset) { index, image in
                                                        Image(uiImage: image)
                                                            .resizable()
                                                            .scaledToFit()
                                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                                            .padding(.leading, index == 0 ? 20 : 0)
                                                            .overlay {
                                                                VStack {
                                                                    HStack {
                                                                        Spacer()
                                                                        
                                                                        Button {
                                                                            viewModel.removePortfolioImage(index: index)
                                                                        } label: {
                                                                            Image(systemName: "xmark.circle.fill")
                                                                                .font(.system(size: 20))
                                                                                .foregroundStyle(.gray.opacity(0.8))
                                                                                .padding(.trailing, 5)
                                                                        }
                                                                        
                                                                    }
                                                                    .padding(.top, 5)
                                                                    
                                                                    Spacer()
                                                                }
                                                            }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    .photosPicker(
                                        isPresented: $viewModel.isPortfolioPhotosPickerVisible,
                                        selection: $viewModel.selectedPortfolioImages,
                                        matching: .images
                                    )
                                    .padding(.bottom, 12)
                                    .onTapGesture {
                                        viewModel.isPortfolioPhotosPickerVisible = true
                                    }
                                    .onChange(of: viewModel.selectedPortfolioImages) {
                                        Task {
                                            await viewModel.convertPortfolioImages()
                                        }
                                    }
                            }
                        }
                    }
                    
                    VStack(spacing: 15) {
                        HStack {
                            Text("총 결제 금액")
                                .font(.pretendard(Pretendard.semiBold, size: 17))
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("\(viewModel.serviceCell?.salary ?? 10000)원")
                                .font(.pretendard(Pretendard.semiBold, size: 24))
                                .foregroundStyle(Color.JJTitle)
                            
                            Spacer()
                        }
                        
                        VStack {
                            HStack {
                                Text("잼잼 서비스 이용약관")
                                    .font(.pretendard(size: 14))
                                    .foregroundStyle(.gray)
                                
                                Spacer()
                                
                                Image(systemName: viewModel.isUsagePolicyInfoButtonTapped ? "chevron.up" : "chevron.down")
                                    .font(.system(size: 15))
                                    .foregroundStyle(.gray)
                            }
                            .onTapGesture {
                                withAnimation(.customAnimation) {
                                    viewModel.isUsagePolicyInfoButtonTapped.toggle()
                                }
                            }
                            
                            if viewModel.isUsagePolicyInfoButtonTapped {
                                VStack {
                                    Text("제1조 (목적) 본 약관은 잼잼 서비스(이하 \"회사\"라 함)가 제공하는 온라인 서비스 플랫폼을 통해 이루어지는 모든 거래 및 서비스 이용에 관한 조건과 절차를 규정함을 목적으로 합니다.\n제2조 (서비스 제공) 회사는 의뢰인과 서비스 제공자를 연결하는 플랫폼을 운영하며, 서비스의 품질과 안전성을 보장하기 위해 노력합니다.\n제3조 (결제 및 환불) - 결제는 사전 결제 방식으로 진행됩니다. - 서비스 시작 전 취소 시 100% 환불이 가능합니다. - 서비스 진행 중 취소 시 진행률에 따라 부분 환불됩니다.\n제4조 (개인정보 보호) 회사는 개인정보보호법에 따라 이용자의 개인정보를 안전하게 보호합니다.")
                                        .font(.pretendard(size: 12))
                                        .foregroundStyle(.gray)
                                }
                                .padding(10)
                                .background(.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                            if viewModel.isAgreeUsagePolicy {
                                HStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(Color.JJTitle)
                                        .overlay {
                                            Image(systemName: "checkmark")
                                                .font(.system(size: 12))
                                                .fontWeight(.bold)
                                                .foregroundStyle(.white)
                                        }
                                        .onTapGesture {
                                            viewModel.isAgreeUsagePolicy = false
                                        }
                                    
                                    Text("위 약관에 동의합니다.")
                                        .font(.pretendard(Pretendard.semiBold, size: 15))
                                    
                                    Spacer()
                                }
                                .padding(.top, 10)
                                
                            } else {
                                HStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(.white)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(.gray, lineWidth: 1)
                                        }
                                        .onTapGesture {
                                            viewModel.isAgreeUsagePolicy = true
                                        }
                                    
                                    Text("위 약관에 동의합니다.")
                                        .font(.pretendard(Pretendard.semiBold, size: 15))
                                    
                                    Spacer()
                                }
                                .padding(.top, 10)
                            }
                        }
                    }
                    .padding(20)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 20)
                    
                    
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 0) {
                    Divider()
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 45)
                            .foregroundStyle(Color.JJTitle)
                            .padding(.horizontal, 20)
                            .overlay {
                                Text("주문하기")
                                    .font(.pretendard(Pretendard.semiBold, size: 15))
                                    .foregroundStyle(.white)
                            }
                            .opacity(viewModel.isAllValidated ? 1.0 : 0.4)
                    }
                    .disabled(!viewModel.isAllValidated)
                    
                    Spacer()
                }
                .frame(height: 70)
                .background(Color.mainBackground)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainBackground)
        .modifier(NavigationBarBackAndTitleAndHomeModifier(title: "서비스 주문", isEntireProgressVisible: $viewModel.isEntireProgressViewVisible))
        .blur(radius: viewModel.isEntireProgressViewVisible ? 2.0 : 0)
        .overlay {
            if viewModel.isEntireProgressViewVisible {
                VStack {
                    ProgressView()
                        .scaleEffect(1.5)
                        .tint(Color.JJTitle)
                        .padding(.bottom, 30)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.gray.opacity(0.5))
            }
        }
        .alert("주문 실패", isPresented: $viewModel.isOrderAlertVisible) {
            Button {
                viewModel.orderAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
            } label: {
                Text("확인")
            }
        } message: {
            Text(viewModel.orderAlertMessage)
        }
        .onTapGesture {
            focus = nil
        }
    }
}

#Preview {
    NavigationStack {
        OrderServiceView(serviceCell: nil)
            .environment(NavigationCore())
            .environment(MainTabBarCapsule())
    }
}
