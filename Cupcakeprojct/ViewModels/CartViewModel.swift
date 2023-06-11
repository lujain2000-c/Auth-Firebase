//
//  CartViewModel.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

//extension CartView{
@MainActor class CartViewModel: ObservableObject{
    
    private var db = Firestore.firestore ()
    
    @Published var counter: Int = 1
    @Published var allItem: [CartModel] = [CartModel(name: "Chocolate Caramel \n Cupcake", price: 12.90,  image: "CupcakeChocolateSmall")]
    
    func addToCart(itemName: String, itemPrice: Double, itemImage: String){
        let newItem = CartModel(name: itemName, price: itemPrice, image: itemImage)
        allItem.insert(newItem, at: 0)
    }
    
    func add(){
        counter += 1
    }
    func delete(){
        if counter != 0 {
            counter -= 1
        }
        
    }
    
    func  removeFromCart(itemName: String, itemPrice: Double, itemImage: String){
        _ = CartModel( name: itemName, price: itemPrice, image: itemImage)
        var count = 0
        for item in allItem{
            if item.name == itemName {
                allItem.remove(at: count)
                
            }else{
                count += 1
            }
        }
    }
    func fetchCartItem() {
        
//        Auth.auth().addStateDidChangeListener { auth, user in
//            if Auth.auth().currentUser != nil {
//                guard let userId = Auth.shared.auth.currentUser?.uid
//                else { return }
                
                db.collection("cart")
                    .getDocuments() { (querySnapshot, err) in
                        if err != nil{
                            print(err?.localizedDescription)
                            return
                        }
                        
                        for doc in querySnapshot!.documents{
                            
                            let name = doc.get("name") as! String
                            let price = doc.get("price") as! Double
                            let category = doc.get("image") as! String
                            self.allItem.append(CartModel( name: name,  price: price, image: ""))
                            
                        }
                        
                    }
         //   }
        //}
    }
    
//    private func persistImageToStorage () {
//        //let filename = UUID() .uuidString
//        Auth.auth().addStateDidChangeListener { auth, user in
//            if Auth.auth().currentUser != nil {
//                guard let userId = Auth.auth().shared.auth.currentUser?.uid
//                else { return }
//                let ref = Storage.storage().shared.storage.reference (withPath: userId)
//                guard let imageData = self.image?.jpegData(compressionQuality:
//                                                            0.5) else { return 3}
//                ref.putData(imageData, metadata: nil) { metadata, err in
//                    if let err = err {
//                        // self. loginStatusMessage = "Failed to push image to
//                        //Storage: \(err)"
//                        return
//                    }
//                    ref.downloadURL { url, err in
//                        if let err = err{
//                            //  self. loginStatusMessage = "Failed to retrieve
//                            //  downloadURl: Merr)"
//                            return
//                        }
//                        // self. loginStatusMessage = "Successfully stored image
//                        // with url: \(ur1?.absoluteString ?? #*).
//                    }
//                }
//            }
//        }
//    }
}
//CartModel(name: "Salt Caramel Cupcake", price: 13, image: "CupcakeCaramel"),
//CartModel(name: "Blueberry Cupcake", price: 15, image: "CupcakeBlueberry")

