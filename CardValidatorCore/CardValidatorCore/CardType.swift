//
//  CardType.swift
//  CardValidatorCore
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import Foundation

public enum CardType: CaseIterable {
  case unknown
  case americanExpress
  case discover
  case mastercard
  case visa

  public var eagerRegexPattern: String? {
    switch self {
    case .unknown:
      return nil
    case .americanExpress:
      return "^3[47]"
    case .discover:
      return "^65|64[4-9]|6011|(622(?:12[6-9]|1[3-9]|[2-8]|9[01]|92[0-5]))"
    case .mastercard:
      return "^(2[3-7]|22[2-9]|5[1-5])"
    case .visa:
      return "^4"
    }
  }

  var maxCardLength: Int {
    switch self {
    case .americanExpress:
      return 15
    case .discover, .mastercard, .visa:
      return 16
    case .unknown:
      return 19
    }
  }
}
