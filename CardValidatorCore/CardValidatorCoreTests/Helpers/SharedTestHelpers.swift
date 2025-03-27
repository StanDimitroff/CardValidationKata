//
//  SharedTestHelpers.swift
//  CardValidatorCoreTests
//
//  Created by Stanislav Dimitrov on 27.03.25.
//

import CardValidatorCore

func anyNSError() -> NSError {
  NSError(domain: "Any error", code: 0)
}

func anyCardNumber() -> String {
  "4543474002249996"
}

func anyCardType() -> CardType {
  CardType.allCases.randomElement()!
}
