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

    XCTAssertThrowsError(try sut.validate(cardNumber: ""))
  }

  func test_validate_throwsInvalidCharactersErrorOnNonDigitCardNumber() {
    let sut = makeSUT()

    XCTAssertThrowsError(try sut.validate(cardNumber: "no-digit card number"))
  }

  private func makeSUT() -> CardValidator {
    RegexCardValidator()
  }
}
