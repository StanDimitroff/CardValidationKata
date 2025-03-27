//
//  ValidateCardTypeUseCaseTests.swift
//  CardValidatorCoreTests
//
//  Created by Stanislav Dimitrov on 27.03.25.
//

import XCTest
import CardValidatorCore

final class ValidateCardTypeUseCaseTests: XCTestCase {

  func test_init_doesNotRequestCardTypeValidation() {
    let (_, validator) = makeSUT()

    XCTAssertEqual(validator.validateCallCount, 0)
  }

  func test_getCardType_throwsErrorCardValidatorError() {
    let (sut, validator) = makeSUT()

    validator.stub(error: anyNSError(), cardType: nil)

    XCTAssertThrowsError(try sut.getCardType(checking: anyCardNumber()))
  }

  func test_getCardType_doesNotThrowErrorOnCardValidatorSuccess() {
    let (sut, validator) = makeSUT()

    validator.stub(error: nil, cardType: nil)

    XCTAssertNoThrow(try sut.getCardType(checking: anyCardNumber()))
  }

  func test_getCardType_deliversTheCorrectCardTypeOnCardValidatorSuccessWithCardType() throws {
    let (sut, validator) = makeSUT()

    let expectedCardType = anyCardType()

    validator.stub(error: nil, cardType: expectedCardType)

    let receivedCardType = try sut.getCardType(checking: anyCardNumber())

    XCTAssertEqual(receivedCardType, expectedCardType)
  }

  private func makeSUT() -> (sut: ValidateCardTypeUseCase, validator: CardValidatorStub)  {
    let cardValidator = CardValidatorStub()
    let sut = ValidateCardTypeUseCase(cardValidator: cardValidator)

    return (sut, cardValidator)
  }

  private class CardValidatorStub: CardValidator {

    struct Stub {
      let error: Error?
      let cardType: CardType?
    }

    private(set) var validateCallCount = 0
    private(set) var stub: Stub?

    func stub(error: Error?, cardType: CardType?) {
      stub = Stub(error: error, cardType: cardType)
    }

    func validate(cardNumber: String) throws -> CardType {
      validateCallCount += 1

      if let error = stub?.error {
        throw error
      }

      if let cardType = stub?.cardType {
        return cardType
      }

      return .unknown
    }
  }

  private func anyNSError() -> NSError {
    NSError(domain: "Any error", code: 0)
  }

  private func anyCardNumber() -> String {
    "4543474002249996"
  }

  private func anyCardType() -> CardType {
    CardType.allCases.randomElement()!
  }
}

