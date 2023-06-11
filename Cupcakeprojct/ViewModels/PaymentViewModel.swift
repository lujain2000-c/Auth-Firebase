//
//  PaymentViewModel.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//

import Foundation
import SwiftUI


extension PaymentView{
    @MainActor class PaymentViewModel: ObservableObject{
        @Published var allMethods: [PaymentModel] = [
            PaymentModel(name: "Credit Card", image: "CreditCard"),
        PaymentModel(name: "Cash", image: "Cash"),
        PaymentModel(name: "ApplePay", image: "ApplePay")]
    }
}
