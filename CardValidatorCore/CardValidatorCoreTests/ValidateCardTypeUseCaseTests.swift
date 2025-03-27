//
//  ValidateCardTypeUseCaseTests.swift
//  CardValidatorCoreTests
//
//  Created by Stanislav Dimitrov on 27.03.25.
//

import XCTest
import CardValidatorCore

final class ValidateCardTypeUseCaseTests: XCTestCase {

  func test_getCardType_throwsErrorCardValidatorError() {
    let (sut, validator) = makeSUT()

    validator.stub(error: anyNSError(), cardType: nil)

    XCTAssertThrowsError(try sut.getCardType(checking: ""))
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

    private(set) var stub: Stub?

    func stub(error: Error?, cardType: CardType?) {
      stub = Stub(error: error, cardType: cardType)
    }

    func validate(cardNumber: String) throws -> CardType {
      if let error = stub?.error {
        throw error
      }

      return .unknown
    }
  }


  private func anyNSError() -> NSError {
    NSError(domain: "Any error", code: 0)
  }
}

