//
//  ValidateCardTypeViewModelTests.swift
//  CardValidatorCoreTests
//
//  Created by Stanislav Dimitrov on 27.03.25.
//

import XCTest
import CardValidatorCore

final class ValidateCardTypeViewModelTests: XCTestCase {

  func test_init_doesNotRequestCardTypeValidation() {
    let (_, useCase) = makeSUT()

    XCTAssertEqual(useCase.getCardTypeCallCount, 0)
  }

  func test_updateCardNumber_doesNotRequestGetCardTypeOnEmptyCardNumber() throws {
    let (sut, useCase) = makeSUT()

    sut.cardNumber = ""

    XCTAssertEqual(useCase.getCardTypeCallCount, 0)
  }

  func test_updateCardNumber_requestsGetCardTypeOnNonEmptyCardNumber() throws {
    let (sut, useCase) = makeSUT()

    sut.cardNumber = anyCardNumber()

    XCTAssertEqual(useCase.getCardTypeCallCount, 1)
  }

  func test_updateCardNumber_updatesErrorOnUseCaseError() throws {
    let (sut, useCase) = makeSUT()

    useCase.stub(error: anyNSError(), cardType: nil)
    sut.cardNumber = invalidCardNumber()

    XCTAssertNotNil(sut.validationError)
  }

  private func makeSUT() -> (sut: ValidateCardTypeViewModel, useCase: CardTypeUseCaseStub) {
    let useCase = CardTypeUseCaseStub()
    let sut = ValidateCardTypeViewModel(useCase: useCase)

    return (sut, useCase)
  }

  private class CardTypeUseCaseStub: CardTypeUseCase {
    private(set) var getCardTypeCallCount = 0
    private(set) var stub: Stub?

    struct Stub {
      let error: Error?
      let cardType: CardType?
    }

    func stub(error: Error?, cardType: CardType?) {
      stub = Stub(error: error, cardType: cardType)
    }

    func getCardType(checking cardNumber: String) throws -> CardType {
      getCardTypeCallCount += 1

      if let error = stub?.error {
        throw error
      }

      return .unknown
    }
  }

  private func invalidCardNumber() -> String {
    "invalid card number"
  }
}
