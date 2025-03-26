//
//  CardValidatorApp.swift
//  CardValidatorApp
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import SwiftUI
import CardValidatorCore
import CardValidatoriOS

@main
struct CardValidatorApp: App {

  var body: some Scene {
    WindowGroup {
      let cardValidator = RegexCardValidator()
      let useCase = ValidateCardTypeUseCase(cardValidator: cardValidator)
      let viewModel = ValidateCardTypeViewModel(useCase: useCase)

      ValidateCardTypeView(viewModel: viewModel)
    }
  }
}
