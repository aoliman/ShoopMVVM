//
//  InputValidator.swift
//  ShoopCore
//
//  Created by Mahmoud Elsheikh on 8/11/21.
//  Copyright © 2021 Shoop. All rights reserved.
//

import Foundation

public enum InputValidationRule {
    case minLength(_ value: Int)
    case maxLength(_ value: Int)
    case regex(_ value: String)
}

open class InputValidator {
    let rules: [InputValidationRule]
    
    init() {
        self.rules = []
    }
    
    public required init(_ rules: [InputValidationRule]) {
        self.rules = rules
    }
    public func evaluate(_ value: String) -> Bool {
        let values = applyRules(value)
        return !values.contains(false)
    }
    private func applyRules(_ value: String) -> [Bool?] {
        return rules
            .map { self.apply($0, on: value) }
            .compactMap { $0 }
    }
}

extension InputValidator {
    private func apply(_ rule: InputValidationRule, on value: String) -> Bool {
        switch rule {
        case .minLength(let min): return checkMinLength(min, value)
        case .maxLength(let max): return checkMaxLength(max, value)
        case .regex(let rgxStr): return checkWithRegex(rgxStr, value)
        }
    }
    private func checkMinLength(_ min: Int, _ value: String) -> Bool {
        return value.count >= min
    }
    private func checkMaxLength(_ max: Int, _ value: String) -> Bool {
        return value.count <= max
    }
    private func checkWithRegex(_ rgx: String, _ value: String) -> Bool {
        let reg = NSPredicate(format: "SELF MATCHES %@", rgx)
        let result = reg.evaluate(with: value)
        return result
    }
}
