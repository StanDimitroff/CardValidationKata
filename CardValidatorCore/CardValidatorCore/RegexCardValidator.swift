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

    guard containsDigitsOnly(in: cardNumber) else { throw CardValidatorError.invalidCharacters }

    let range = NSRange(location: 0, length: cardNumber.utf16.count)

    let matchedCardType = CardType.allCases.first { type in
      guard let pattern = type.eagerRegexPattern else { return false }
      let expression = try? NSRegularExpression(pattern: pattern)

      return expression?.firstMatch(in: cardNumber, options: [], range: range) != nil
    }

    return matchedCardType ?? .unknown
  }

  private func containsDigitsOnly(in string: String) -> Bool {
    CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string))
  }
}
