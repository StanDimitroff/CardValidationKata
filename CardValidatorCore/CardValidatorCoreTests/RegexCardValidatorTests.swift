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

  func test_validate_returnsUnknownCardTypeOnCardNumberWithNotDefinedCardType() {
    let sut = makeSUT()

    let cardType = try? sut.validate(cardNumber: "111111111111")

    XCTAssertEqual(cardType, .unknown)
  }

  func test_validate_returnsValidCardTypeOnValidCardNumber() throws {
    let sut = makeSUT()

    let amexType = try sut.validate(cardNumber: "345678901234564")
    XCTAssertEqual(amexType, .americanExpress)

    let discoverType = try sut.validate(cardNumber: "6011201559638046790")
    XCTAssertEqual(discoverType, .discover)

    let mastercardType = try sut.validate(cardNumber: "5436031030606378")
    XCTAssertEqual(mastercardType, .mastercard)

    let visaType = try sut.validate(cardNumber: "4916301720257093")
    XCTAssertEqual(visaType, .visa)
  }

  private func makeSUT() -> CardValidator {
    RegexCardValidator()
  }
}
