//
//  ValidateCardTypeViewModel.swift
//  CardValidatorCore
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import Foundation

@Observable
public final class ValidateCardTypeViewModel {

  private let useCase: CardTypeUseCase

  public var cardNumber: String = "" {
    didSet {
      validateCardType()
    }
  }

  private(set) public var validationError: Error?
  private(set) public var cardType: CardTypePresentationModel?

  public init(useCase: CardTypeUseCase) {
    self.useCase = useCase
  }

  private func validateCardType() {
    guard !cardNumber.isEmpty else {
      cardType = nil
      return
    }

    do {
      let cardType = try useCase.getCardType(checking: cardNumber)
      self.cardType = cardType.toPresentationModel()
    } catch {
      self.validationError = error
    }
  }
}

public struct CardTypePresentationModel {
  public let imageName: String
}

private extension CardType {
  func toPresentationModel() -> CardTypePresentationModel {
    let imageNameTransformer: (CardType) -> String = { cardType in
      switch cardType {
      case .unknown:
        return "Unknown"
      case .americanExpress:
        return "amex"
      case .discover:
        return "discover"
      case .mastercard:
        return "mastercard"
      case .visa:
        return "visa"
      }
    }

    return CardTypePresentationModel(imageName: imageNameTransformer(self))
  }
}

