//
//  Keychain.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import Foundation
import Security

enum Keychain {
    static let service = Bundle.main.bundleIdentifier ?? "com.khi.jamjam"
    static let account = "accessToken"
    
    // MARK: Store Token
    static func storeToken(_ token: String) -> Bool {
        guard let data = token.data(using: .utf8) else { return false }
        
        deleteToken()
        
        let query: [CFString: Any] = [
            kSecClass:           kSecClassGenericPassword,
            kSecAttrService:     service,
            kSecAttrAccount:     account,
            kSecValueData:       data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    // MARK: Fetch Token
    static func fetchToken() -> String? {
        let query: [CFString: Any] = [
            kSecClass:           kSecClassGenericPassword,
            kSecAttrService:     service,
            kSecAttrAccount:     account,
            kSecReturnData:      true,
            kSecMatchLimit:      kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard
            status == errSecSuccess,
            let data = item as? Data,
            let token = String(data: data, encoding: .utf8)
                
        else {
            return nil
        }
        
        return token
    }
    
    // MARK: Delete Token
    static func deleteToken() {
        let query: [CFString: Any] = [
            kSecClass:       kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ]
        
        SecItemDelete(query as CFDictionary)
    }
}
