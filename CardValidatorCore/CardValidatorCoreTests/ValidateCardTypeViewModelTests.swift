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

  func test_updateCardNumber_requestsGetCardTypeEmptyCardNumber() throws {
    let (sut, useCase) = makeSUT()

    sut.cardNumber = ""

    XCTAssertEqual(useCase.getCardTypeCallCount, 0)
  }

  func test_updateCardNumber_requestsGetCardTypeOnNonEmptyCardNumber() throws {
    let (sut, useCase) = makeSUT()

    sut.cardNumber = anyCardNumber()

    XCTAssertEqual(useCase.getCardTypeCallCount, 1)
  }

  private func makeSUT() -> (sut: ValidateCardTypeViewModel, useCase: CardTypeUseCaseStub) {
    let useCase = CardTypeUseCaseStub()
    let sut = ValidateCardTypeViewModel(useCase: useCase)

    return (sut, useCase)
  }

  private class CardTypeUseCaseStub: CardTypeUseCase {
    private(set) var getCardTypeCallCount = 0

    func getCardType(checking cardNumber: String) throws -> CardType {
      getCardTypeCallCount += 1

      return .unknown
    }
  }
}
