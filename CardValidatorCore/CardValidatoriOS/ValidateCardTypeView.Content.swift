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
    private let errorText: String?

    init(
      cardNumber: Binding<String>,
      cardType: String,
      errorText: String?
    ) {
      self.cardNumber = cardNumber
      self.cardType = cardType
      self.errorText = errorText
    }

    var body: some View {
      VStack(alignment: .leading, spacing: 16) {
        HStack(alignment: .top) {
          VStack(alignment: .leading, spacing: 8) {
            TextField("", text: cardNumber, prompt: Text("Type your card number"))
              .keyboardType(.numberPad)
              .multilineTextAlignment(.center)
              .frame(height: 43)
              .overlay(
                RoundedRectangle(cornerRadius: 8).stroke(.black, lineWidth: 1)
              )

            if let errorText {
              Text(errorText)
                .font(.footnote)
                .foregroundStyle(.red)
                .padding(.leading, 4)
            }
          }

          Image(cardType, bundle: Bundle(identifier: "com.getset.CardValidatoriOS"))
            .frame(width: 67, height: 43)

            .background(
              RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.white)
            )
            .overlay(
              RoundedRectangle(cornerRadius: 8).stroke(.black, lineWidth: 1)
            )
        }
        .padding()
      }
    }
  }
}

#Preview {
  ValidateCardTypeView.Content(
    cardNumber: .constant("1234"),
    cardType: "discover",
    errorText: "Invalid Card lenght"
  )
}
