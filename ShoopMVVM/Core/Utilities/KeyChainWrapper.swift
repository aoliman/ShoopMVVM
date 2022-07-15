//
//  KeyChainWrapper.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh on 03/10/2021.
//  Copyright © 2021 Shoop. All rights reserved.
//

import Foundation
import Security

class KeyChainHandler {
    static let shared = KeyChainHandler()
    private init() {}
    
    fileprivate func save(by key: String, value: String?) {
        let query = keychainQuery(withKey: key)
        let objectData: Data? = value?.data(using: .utf8, allowLossyConversion: false)
        
        if SecItemCopyMatching(query, nil) == noErr {
            if let dictData = objectData {
                let status = SecItemUpdate(query, NSDictionary(dictionary: [kSecValueData: dictData]))
            } else {
                let status = SecItemDelete(query)
                print("status: ", status)
            }
        } else {
            if let dictData = objectData {
                query.setValue(dictData, forKey: kSecValueData as String)
                let status = SecItemAdd(query, nil)
                print("status: ", status)
            }
        }
    }
    
    fileprivate func load(by key: String) -> String? {
        let query = keychainQuery(withKey: key)
        query.setValue(kCFBooleanTrue, forKey: kSecReturnData as String)
        query.setValue(kCFBooleanTrue, forKey: kSecReturnAttributes as String)
        
        var result: CFTypeRef?
        let status = SecItemCopyMatching(query, &result)
        
        guard
            let resultsDict = result as? NSDictionary,
            let resultsData = resultsDict.value(forKey: kSecValueData as String) as? Data,
            status == noErr
        else {
            print("status: ", status)
            return nil
        }
        return String(data: resultsData, encoding: .utf8)
    }
    private func keychainQuery(withKey key: String) -> NSMutableDictionary {
            let result = NSMutableDictionary()
            result.setValue(kSecClassGenericPassword, forKey: kSecClass as String)
            result.setValue(key, forKey: kSecAttrService as String)
            result.setValue(kSecAttrAccessibleAlwaysThisDeviceOnly, forKey: kSecAttrAccessible as String)
            return result
        }
}

// MARK: Keychain wrapper
public enum KeyChainWrapper: String {
    case apiToken = "API_TOKEN"
    case userId = "USER_ID"
}

extension KeyChainWrapper {
    public func load() -> String? {
        return KeyChainHandler.shared.load(by: self.rawValue)
    }
    public func save(value: String?) {
        DispatchQueue.global().sync(flags: .barrier) {
            KeyChainHandler.shared.save(by: self.rawValue, value: value)
        }
    }
}
