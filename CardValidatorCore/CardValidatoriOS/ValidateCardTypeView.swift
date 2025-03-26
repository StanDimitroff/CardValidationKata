//
//  ValidateCardTypeView.swift
//  CardValidatoriOS
//
//  Created by Stanislav Dimitrov on 26.03.25.
//

import SwiftUI
import CardValidatorCore

public struct ValidateCardTypeView: View {

  @Bindable private var viewModel: ValidateCardTypeViewModel

  public init(viewModel: ValidateCardTypeViewModel) {
    self.viewModel = viewModel
  }

  public var body: some View {
    Text("Hello, World!")
  }
}

//#Preview {
//  ValidateCardTypeView()
//}
