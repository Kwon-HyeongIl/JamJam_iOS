//
//  ServiceCellView.swift
//  Jamjam
//
//  Created by 권형일 on 7/9/25.
//

import SwiftUI
import Shimmer

struct ServiceCellView: View {
    let service: ServiceCellDomainModel
    let upperWidth: CGFloat
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: service.thumbnailUrl)) { state in
                switch state {
                case .empty:
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray.opacity(0.1))
                        .shimmering()
                    
                case .success(let image):
                    image
                        .resizable()
                    
                case .failure:
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray.opacity(0.1))
                    
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: upperWidth * 0.4, height: upperWidth * 0.4)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.bottom, 5)
            
            HStack {
                Text(service.serviceName)
                    .font(.pretendard(Pretendard.semiBold, size: 17))
                
                Spacer()
            }
            .padding(.bottom, 3)
            
            HStack {
                Text("\(service.salary)~")
                    .font(.pretendard(Pretendard.medium, size: 15))
                
                Spacer()
            }
            .padding(.bottom, 2)
            
            HStack {
                Text(service.providerName)
                    .font(.pretendard(size: 14))
                    .foregroundStyle(.gray)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ServiceCellView(service: ServiceCellDomainModel(serviceId: 0, thumbnailUrl: "https://github.com/user-attachments/assets/a3f573b2-1618-4b4f-ac2c-dc50005d6b0a", serviceName: "경제스톡", providerName: "권형일", salary: 10000), upperWidth: 100)
}
