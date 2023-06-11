//
//  CupcakePageViewModel.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//


import SwiftUI
import FirebaseFirestore



    @MainActor class CupcakePageViewModel: ObservableObject{
        
        private var db = Firestore.firestore ()
        
        @Published var cupcakeInfo = CupcakePageModel(name: "Chocolate Caramel Cupcake", price: 12.90, image: "CupcakeChocolateSmall")
        
        @Published var allFacts: [NutritionFactsModel] = [
            NutritionFactsModel(name: "Calorice", value: 245.0),
            NutritionFactsModel(name: "Prot", value: 3.5),
            NutritionFactsModel(name: "Fat", value: 8.2),
            NutritionFactsModel(name: "Carbe", value: 15.8)]
        
      
            
    
    
    func addData (item: String ,price: Double,image: String) {
    
    
            let docData: [String: Any] = [
                "item": item,
                "price": price,
                "image": image
    
            ]
            db.collection("cart").document().setData(docData){ error in
                if let error = error {
                    print (error.localizedDescription)
                } else {
                        print("Document successfully written!")
                    }
            }
        }
}

