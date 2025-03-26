//
//  CardValidator.swift
//  CardValidatorCore
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import Foundation

public protocol CardValidator {
  func validate(cardNumber: String) throws -> CardType
}

public enum CardValidatorError: Error {
  case missingCardNumber
  case invalidCharacters
}
