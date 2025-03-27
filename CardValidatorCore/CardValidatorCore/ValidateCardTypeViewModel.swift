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

  public var cardNumber: String = "" {
    didSet {
      validateCardType()
    }
  }
  private(set) public var cardType: CardTypePresentationModel?

  public init(useCase: ValidateCardTypeUseCase) {
    self.useCase = useCase
  }

  private func validateCardType() {
    do {
      let cardType = try useCase.getCardType(checking: cardNumber)
      self.cardType = cardType.toPresentationModel()
    } catch {

    }
  }
}

public struct CardTypePresentationModel {
  public let name: String
}

private extension CardType {
  func toPresentationModel() -> CardTypePresentationModel {
    let nameTransformer: (CardType) -> String = { cardType in
      switch cardType {
      case .unknown:
        return "Unknown"
      case .americanExpress:
        return "American Express"
      case .discover:
        return "Discover"
      case .mastercard:
        return "MasterCard"
      case .visa:
        return "Visa"
      }
    }

    return CardTypePresentationModel(name: nameTransformer(self))
  }
}

