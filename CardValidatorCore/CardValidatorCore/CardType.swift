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

  public var regexPattern: String? {
    switch self {
    case .unknown:
      return nil
    case .americanExpress:
      return "^3[47]\\d{13}$"
    case .discover:
      return "^65[0-9]{14}|64[4-9][0-9]{13}|6011[0-9]{12}|(622(?:12[6-9]|1[3-9][0-9]|[2-8][0-9][0-9]|9[01][0-9]|92[0-5])[0-9]{10})$"
    case .mastercard:
      return "^(5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)\\d{12}$"
    case .visa:
      return "^4\\d{12}(\\d{3}|\\d{6})?$"
    }
  }
}
