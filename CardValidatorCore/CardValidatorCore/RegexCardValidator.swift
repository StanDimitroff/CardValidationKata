//
//  RegexCardValidator.swift
//  CardValidatorCore
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import Foundation

public final class RegexCardValidator: CardValidator {

  public init() {}

  public func validateCardType(checking cardNumber: String) throws -> CardType {
    try validate(cardNumber)

    let range = NSRange(location: 0, length: cardNumber.utf16.count)

    let matchedCardType = CardType.allCases.first { type in
      guard let pattern = type.eagerRegexPattern else { return false }
      let expression = try? NSRegularExpression(pattern: pattern)

      return expression?.firstMatch(in: cardNumber, options: [], range: range) != nil
    }

    guard let matchedCardType else { return .unknown }

    if isCardNumberWithinCardTypeLenghtLimit(cardNumber, for: matchedCardType) { return matchedCardType }

    throw CardValidatorError.invalidCardNumberLenght
  }

  private func validate(_ cardNumber: String) throws {
    guard !cardNumber.isEmpty else { throw CardValidatorError.missingCardNumber }
    guard containsDigitsOnly(in: cardNumber) else { throw CardValidatorError.invalidCharacters }
  }

  private func containsDigitsOnly(in string: String) -> Bool {
    CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string))
  }

  private func isCardNumberWithinCardTypeLenghtLimit(_ cardNumber: String, for type: CardType) -> Bool {
    return cardNumber.count <= type.maxCardNumberLength
  }
}
