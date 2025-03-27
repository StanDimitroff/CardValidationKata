//
//  CardValidator.swift
//  CardValidatorCore
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import Foundation

public protocol CardValidator {
  func validateCardType(checking cardNumber: String) throws -> CardType
}

public enum CardValidatorError: LocalizedError {
  case missingCardNumber
  case invalidCharacters
  case invalidCardNumberLenght

  public var errorDescription: String? {
    switch self {
    case .missingCardNumber:
      return "Missing card number"
    case .invalidCharacters:
      return "Only digit are allowed"
    case .invalidCardNumberLenght:
      return "The number is invalid for this card type"
    }
  }
}
