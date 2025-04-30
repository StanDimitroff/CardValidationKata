//
//  CardValidatingIntegrationTests.swift
//  CardValidatorCoreTests
//
//  Created by Stanislav Dimitrov on 7.04.25.
//

import XCTest
import CardValidatorCore

final class CardValidatingIntegrationTests: XCTestCase {
  
  func test_validateCardType_deliversCardType() {
    let cardValidator = RegexCardValidator()
    let useCase = ValidateCardTypeUseCase(cardValidator: cardValidator)
    let viewModel = ValidateCardTypeViewModel(useCase: useCase)

    viewModel.cardNumber = "4543474002249996"

    XCTAssertNil(viewModel.validationError)
    XCTAssertNotNil(viewModel.cardType)
    XCTAssertEqual(viewModel.cardType?.imageName, "visa")
  }
}
