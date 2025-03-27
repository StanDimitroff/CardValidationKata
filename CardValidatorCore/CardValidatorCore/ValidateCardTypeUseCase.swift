//
//  ValidateCardTypeUseCase.swift
//  CardValidatorCore
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import Foundation

public final class ValidateCardTypeUseCase: CardTypeUseCase {

  private let cardValidator: CardValidator

  public init(cardValidator: CardValidator) {
    self.cardValidator = cardValidator
  }

  public func getCardType(checking cardNumber: String) throws -> CardType {
    try cardValidator.validate(cardNumber: cardNumber)
  }
}
