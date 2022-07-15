//
//  File.swift
//  Networking
//
//  Created by Mahmoud Elsheikh on 01/10/2021.
//

import Foundation

open class UserSession {
    private init() { /* Single isntance class */}
    public static let shared = UserSession()
    
    public var userId: String?
    
    public var companies: [CompanyProfile] = []
    public var userProfile: UserProfile?
    public var activeProfile: CompanyProfile?
    public var isVerified: Bool = false
    public var hasCovidPass: Bool = false
    public var isCovidPassExpired: Bool = false
    public var covidPassType: CovidPassType = .none
    public var verificatoinUrl: String?
    
    public func clearData() {
        companies   = []
        userProfile = nil
        isVerified  = false
        hasCovidPass = false
       // NetworkSession.shared.token = nil
    }
}

public enum CovidPassType: String {
    case none
    case international
    case domestic
    public static func fromBool(isInternational: Bool?) -> CovidPassType {
        switch isInternational {
        case true:
            return .international
        case false:
            return .domestic
        default:
            return .none
        }
    }
}

public struct ProfileDataResponse : Codable{
    public let code: String?
    public let data: ProfileData
}

// MARK: Models for profile
public struct ProfileData: Codable {
    public let isVerified, hasCovidPass: Bool?
    public let hasInternationalPass: Bool
    public let userProfile: UserProfile
    public let companies: [CompanyProfile]
    public let verificatoinUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case isVerified = "is_verified"
        case hasCovidPass = "has_covid_pass"
        case userProfile = "user_profiles"
        case companies = "company_profiles"
        case verificatoinUrl = "veriff_session_url"
        case hasInternationalPass = "is_international"
    }

        
}
   
public struct CompanyProfile: Codable {
    public let id: String
    public let companyName: String
    public let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case companyName = "company_name"
        case imageUrl = "image_url"
    }
}
public struct UserProfile: Codable {
    public let id: String
    public let name: String?
    public let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "image_url"
    }
}
