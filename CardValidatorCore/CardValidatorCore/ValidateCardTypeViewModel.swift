//
//  ValidateCardTypeViewModel.swift
//  CardValidatorCore
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import Foundation

@Observable
public final class ValidateCardTypeViewModel {

  private let useCase: ValidateCardTypeUseCase

  public var cardNumber: String = ""
  private(set) public var cardType: CardType = .unknown

  public init(useCase: ValidateCardTypeUseCase) {
    self.useCase = useCase
  }

  public func validateCardType() {
    do {
      let cardType = try useCase.getCardType(checking: cardNumber)
    } catch {

    }
  }


}
