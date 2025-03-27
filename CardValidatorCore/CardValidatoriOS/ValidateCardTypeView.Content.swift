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

    init(
      cardNumber: Binding<String>,
      cardType: String
    ) {
      self.cardNumber = cardNumber
      self.cardType = cardType
    }

    var body: some View {
      VStack(alignment: .leading, spacing: 16) {
        HStack {
          TextField("", text: cardNumber, prompt: Text("Type your card number"))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.numberPad)
          Text(cardType)
        }
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
