//
//  FCMCenter.swift
//  Jamjam
//
//  Created by 권형일 on 6/29/25.
//

import Foundation

class FCMManager {
    static func sendFCMPushNoti(targetUserFCMToken: String, isTargetUserApprove: Bool, content: String) {
    
            // 수신 사용자가 알림을 허용했는지 체크
    
//            let json: [String: Any] = [
//                "message": [
//                    "token": deviceToken,
//                    "notification": [
//                        "body": notification.body,
//                        "title": notification.title
//                    ]
//                ]
//            ]
//    
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
//            request.setValue("Bearer \(googleAccessToken ?? "")", forHTTPHeaderField: "Authorization")
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    
//            let session = URLSession(configuration: .default)
//            session.dataTask(with: request) { _, _, error in
//                if let error {
//                    print(error.localizedDescription)
//                    return
//                }
//            }
//            .resume()
        }
        
    //    private func getGoogleOAuthAccessToken() async {
    //        guard let accessTokenUrlBody = Bundle.main.infoDictionary?["GOOGLE_OAUTH_ACCESS_TOKEN_URL_BODY"] as? String else { return }
    //        guard let url = URL(string: "https://\(accessTokenUrlBody)") else {
    //            print("Invalid URL for token")
    //            return
    //        }
    //
    //        do {
    //            guard let firebaseAuthToken = try await Auth.auth().currentUser?.getIDToken() else { return }
    //
    //            var request = URLRequest(url: url)
    //            request.httpMethod = "GET"
    //            request.addValue("Bearer \(firebaseAuthToken)", forHTTPHeaderField: "Authorization")
    //
    //            let (data, _) = try await URLSession.shared.data(for: request)
    //                // Token을 받고 나서 계속 알림 요청을 보내기 위해 URLSession.shared.data 사용
    //
    //            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
    //               let accessTokenData = json["accessToken"] as? [String: Any],
    //               let token = accessTokenData["token"] as? String {
    //                self.googleAccessToken = token
    //
    //            } else {
    //                print("Invalid response")
    //            }
    //
    //        } catch {
    //            print(error.localizedDescription)
    //        }
    //    }
}
