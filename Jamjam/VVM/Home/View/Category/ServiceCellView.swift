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
                        .scaledToFill()
                    
                case .failure:
                    Image(systemName: "photo")
                        .font(.system(size: 20))
                        .foregroundStyle(.gray.opacity(0.5))
                    
                @unknown default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fill)
            .clipped()
            .padding(.bottom, 5)
            
            HStack {
                Text(service.serviceName)
                    .font(.pretendard(Pretendard.semiBold, size: 18))
                
                Spacer()
            }
            .padding(.bottom, 3)
            
            HStack {
                Text("\(service.salary)~")
                    .font(.pretendard(Pretendard.medium, size: 16))
                
                Spacer()
            }
            .padding(.bottom, 2)
            
            HStack {
                Text(service.providerName)
                    .font(.pretendard(size: 15))
                    .foregroundStyle(.gray)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ServiceCellView(service: ServiceCellDomainModel(thumbnailUrl: "https://github.com/user-attachments/assets/a3f573b2-1618-4b4f-ac2c-dc50005d6b0a", serviceName: "경제스톡", providerName: "권형일", salary: 10000))
}
