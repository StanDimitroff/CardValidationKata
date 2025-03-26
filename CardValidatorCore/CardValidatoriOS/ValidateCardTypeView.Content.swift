//
//  ValidateCardTypeView.Content.swift
//  CardValidatoriOS
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import SwiftUI

extension ValidateCardTypeView {
  struct Content: View {

    private let cardNumber: Binding<String>
    private let validateCardType: () -> Void

    init(
      cardNumber: Binding<String>,
      validateCardType: @escaping () -> Void = {}
    ) {
      self.cardNumber = cardNumber
      self.validateCardType = validateCardType
    }

    var body: some View {
      VStack {
        TextField("", text: cardNumber)
      }
    }
  }
}

#Preview {
  ValidateCardTypeView.Content(cardNumber: .constant("1234"))
}
