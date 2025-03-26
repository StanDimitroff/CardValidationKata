//
//  RegexCardValidatorTests.swift
//  CardValidatorCoreTests
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import XCTest
import CardValidatorCore

final class RegexCardValidatorTests: XCTestCase {

  // MARK: - Sad path

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

  // MARK: - Happy path

  func test_validate_doesNotThrowErrorOnValidationSuccess() {
    let sut = makeSUT()

    XCTAssertNoThrow(try sut.validate(cardNumber: "4543474002249996"))
  }

  func test_validate_returnsUnknownCardTypeOnCardNumberWithNotdefinedCardType() {
    let sut = makeSUT()

    let cardType = try? sut.validate(cardNumber: "111111111111")

    XCTAssertEqual(cardType, .unknown)
  }

  private func makeSUT() -> CardValidator {
    RegexCardValidator()
  }
}
