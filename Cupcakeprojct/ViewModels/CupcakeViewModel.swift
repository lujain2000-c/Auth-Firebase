//
//  CupcakeViewModel.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//

import SwiftUI
import FirebaseFirestore


    @MainActor class CupcakeViewModel: ObservableObject{
        
        private var db = Firestore.firestore ()
        
        @Published var allCategory:[CategoryModel] = [
            CategoryModel(name: "All", image: "AllCategory", color: Color("Brown")),
            CategoryModel(name: "Chocolate", image: "Chocolate", color: Color("White")),
            CategoryModel(name: "Birries", image: "Birries", color: Color("White")),
            CategoryModel(name: "No Suger", image: "NoSugar", color: Color("White"))
        ]
        
        @Published var allCupcake:[CupcakeModel] = [
            CupcakeModel(name: "Chocolate Caramel \n Cupcake ", imageName: "CupcakeChocolateSmall", price: 12.90, category: "Chocolate"),
            CupcakeModel(name: "Salt Caramel \n Cupcake ", imageName: "CupcakeCaramel", price: 10.90, category: "No Suger"), CupcakeModel(name: "Blueberry \n Cupcake", imageName: "CupcakeBlueberry", price: 9.90, category: "Birries")]
    

        func catecories(catecory: String ){
            
            switch(catecory){
            case "Chocolate":
                allCupcake = [
                    CupcakeModel(name: "Chocolate Caramel \n Cupcake ", imageName: "CupcakeChocolateSmall", price: 12.90, category: "Chocolate"),
                    CupcakeModel(name: "Salt Caramel \n Cupcake ", imageName: "CupcakeCaramel", price: 10.90, category: "Caramel"), CupcakeModel(name: "Blueberry \n Cupcake", imageName: "CupcakeBlueberry", price: 9.90, category: "berry")]
                var count = 0
                for cupcake in allCupcake{
                    if cupcake.category != "Chocolate" {
                        allCupcake.remove(at: count)
                        
                        count -= 1
                    }
                    count += 1
                }
                    case "No Suger":
                allCupcake = [
                    CupcakeModel(name: "Chocolate Caramel \n Cupcake ", imageName: "CupcakeChocolateSmall", price: 12.90, category: "Chocolate"),
                    CupcakeModel(name: "Salt Caramel \n Cupcake ", imageName: "CupcakeCaramel", price: 10.90, category: "Caramel"), CupcakeModel(name: "Blueberry \n Cupcake", imageName: "CupcakeBlueberry", price: 9.90, category: "berry")]
                        var count = 0
                        for cupcake in allCupcake{
                            if cupcake.category != "Caramel" {
                                allCupcake.remove(at: count)
                                count -= 1
                            }
                            count += 1
                        }
                        
                    case "Birries":
                allCupcake = [
                    CupcakeModel(name: "Chocolate Caramel \n Cupcake ", imageName: "CupcakeChocolateSmall", price: 12.90, category: "Chocolate"),
                    CupcakeModel(name: "Salt Caramel \n Cupcake ", imageName: "CupcakeCaramel", price: 10.90, category: "Caramel"), CupcakeModel(name: "Blueberry \n Cupcake", imageName: "CupcakeBlueberry", price: 9.90, category: "berry")]
                        var count = 0
                        for cupcake in allCupcake{
                            if cupcake.category != "berry" {
                                allCupcake.remove(at: count)
                                count -= 1
                            }
                            count += 1
                            
                        }
                        
                    default:
                        allCupcake = [
                            CupcakeModel(name: "Chocolate Caramel \n Cupcake ", imageName: "CupcakeChocolateSmall", price: 12.90, category: "Chocolate"),
                            CupcakeModel(name: "Salt Caramel \n Cupcake ", imageName: "CupcakeCaramel", price: 10.90, category: "Caramel"), CupcakeModel(name: "Blueberry \n Cupcake", imageName: "CupcakeBlueberry", price: 9.90, category: "berry")]
                    }
//
//
            }
        
        
        func fetchMenu() {

            db.collection("menu")
                .getDocuments() { (querySnapshot, err) in
                    if err != nil{
                        print(err?.localizedDescription)
                        return
                    }

                    for doc in querySnapshot!.documents{

                        let name = doc.get("name") as! String
                        let price = doc.get("price") as! Double
                        let category = doc.get("category") as! String
                        self.allCupcake.append(CupcakeModel( name: name, imageName: "", price: price, category: category))
                        
                    }

                }
        }
    }


