//
//  RegexCardValidatorTests.swift
//  CardValidatorCoreTests
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import XCTest
import CardValidatorCore

final class RegexCardValidatorTests: XCTestCase {

  func test_validate_throwsMissingCardNumberErrorOnEmptyCardNumber() {
    let sut = makeSUT()

    var validationError: CardValidatorError?

    do {
      try _ = sut.validate(cardNumber: "")
    } catch {
      validationError = error as? CardValidatorError
    }

    XCTAssertEqual(validationError, CardValidatorError.missingCardNumber)
  }

  func test_validate_throwsInvalidCharactersErrorOnNonDigitCardNumber() {
    let sut = makeSUT()

    var validationError: CardValidatorError?

    do {
      try _ = sut.validate(cardNumber: "no-digit card number")
    } catch {
      validationError = error as? CardValidatorError
    }

    XCTAssertEqual(validationError, CardValidatorError.invalidCharacters)
  }

  private func makeSUT() -> CardValidator {
    RegexCardValidator()
  }
}
