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
      try _ = sut.validateCardType(checking: "")
    } catch {
      validationError = error as? CardValidatorError
    }

    XCTAssertEqual(validationError, CardValidatorError.missingCardNumber)
  }

  func test_validate_throwsInvalidCharactersErrorOnNonDigitCardNumber() {
    let sut = makeSUT()

    var validationError: CardValidatorError?

    do {
      try _ = sut.validateCardType(checking: "non-digit card number")
    } catch {
      validationError = error as? CardValidatorError
    }

    XCTAssertEqual(validationError, CardValidatorError.invalidCharacters)
  }

  func test_validate_throwsInvalidCardNumberLenghtErrorOnTooLongCardNumber() {
    let sut = makeSUT()

    var validationError: CardValidatorError?

    do {
      try _ = sut.validateCardType(checking: "454347400224999600000")
    } catch {
      validationError = error as? CardValidatorError
    }

    XCTAssertEqual(validationError, CardValidatorError.invalidCardNumberLenght)
  }

  // MARK: - Happy path

  func test_validate_doesNotThrowErrorOnValidationSuccess() {
    let sut = makeSUT()

    XCTAssertNoThrow(try sut.validateCardType(checking: "4543474002249996"))
  }

  func test_validate_returnsUnknownCardTypeOnCardNumberWithNotDefinedCardType() {
    let sut = makeSUT()

    let cardType = try? sut.validateCardType(checking: "111111111111")

    XCTAssertEqual(cardType, .unknown)
  }

  func test_validate_returnsValidCardTypeOnValidCardNumber() throws {
    let sut = makeSUT()

    let amexType = try sut.validateCardType(checking: "345678901234564")
    XCTAssertEqual(amexType, .americanExpress)

    let discoverType = try sut.validateCardType(checking: "6011201559638046")
    XCTAssertEqual(discoverType, .discover)

    let mastercardType = try sut.validateCardType(checking: "5436031030606378")
    XCTAssertEqual(mastercardType, .mastercard)

    let visaType = try sut.validateCardType(checking: "4916301720257093")
    XCTAssertEqual(visaType, .visa)
  }

  private func makeSUT() -> CardValidator {
    RegexCardValidator()
  }
}
