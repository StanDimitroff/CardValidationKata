//
//  RegexCardValidator.swift
//  CardValidatorCore
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import Foundation

public final class RegexCardValidator: CardValidator {

  public init() {}

  public func validate(cardNumber: String) throws -> CardType {
    guard cardNumber.isEmpty == false else { throw CardValidatorError.missingCardNumber }

    return .unknown
  }
}
