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
    private let cardType: String
    private let validateCardType: () -> Void

    init(
      cardNumber: Binding<String>,
      cardType: String,
      validateCardType: @escaping () -> Void = {}
    ) {
      self.cardNumber = cardNumber
      self.cardType = cardType
      self.validateCardType = validateCardType
    }

    var body: some View {
      VStack(alignment: .leading, spacing: 16) {
        HStack {
          TextField("", text: cardNumber, prompt: Text("Type your card number"))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.numberPad)
          Text(cardType)
        }
        Button("Validate", action: validateCardType)
      }
      .padding()
    }
  }
}

#Preview {
  ValidateCardTypeView.Content(
    cardNumber: .constant("1234"),
    cardType: "Visa"
  )
}
