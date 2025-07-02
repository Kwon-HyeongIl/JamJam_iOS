//
//  TestView.swift
//  Jamjam
//
//  Created by 권형일 on 6/24/25.
//

import SwiftUI

struct TestView: View {
    @State private var vm = TestViewModel(roomId: 1)   // 테스트용 roomId

        var body: some View {
            VStack(spacing: 0) {
                Text("roomId \(vm.roomId)")
                Text("senderId \(vm.senderId)")
                // 메시지 리스트
                ScrollViewReader { proxy in
                    List(vm.messages) { msg in
                        HStack {
                            bubble(msg.content.content, color: .blue, fg: .white)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }

                Divider()

                // 입력창
                HStack {
                    TextField("메시지 입력", text: $vm.inputText)
                        .textFieldStyle(.roundedBorder)

                    Button("보내기") { vm.send() }
                        .disabled(vm.inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding()
            }
        }

        @ViewBuilder
        private func bubble(_ text: String, color: Color, fg: Color) -> some View {
            Text(text)
                .padding(10)
                .foregroundStyle(fg)
                .background(color, in: RoundedRectangle(cornerRadius: 12))
                .frame(maxWidth: 250, alignment: .leading)
        }
}

#Preview {
    TestView()
}
