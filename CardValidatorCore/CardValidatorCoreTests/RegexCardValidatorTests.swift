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

  private func makeSUT() -> CardValidator {
    RegexCardValidator()
  }
}
