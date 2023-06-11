//
//  DataManager.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//
import SwiftUI
import FirebaseFirestore

@MainActor class DataManager: ObservableObject{

    //@Published var
    
    //@Published var contactsName: [String] = []
//    @Published var callerData = [""]
//    @Published var callerName: String = ""
//    @Published var callerNum: String = ""
//
//    private var db = Firestore.firestore ()
//    func fetchData() {
//
//        db.collection("menu")
//            .getDocuments() { (querySnapshot, err) in
//                if err != nil{
//                    print(err?.localizedDescription)
//                    return
//                }
//
//                for doc in querySnapshot!.documents{
//
//                    let name = doc.get("name") as! String
//                    let price = doc.get("price") as! Double
//                    let category = doc.get("category") as! String
//                    self.allCupcake.append(CupcakeModel( name: name, imageName: "", price: price, category: category))
//
//                }
//
//            }
//    }
//
//    func fetchDocument (){
//        let docRef = db.collection("menu")
//
//        docRef.getDocuments() { (querySnapshot, err) in
//            if err != nil{
//                print(err?.localizedDescription)
//                return
//            }
//
//            for doc in querySnapshot!.documents{
//                let data = querySnapshot?.data()
//
//                self.callerData.append(data?["fName"] as! String)
//
//                self.callerData.append(data?["number"] as! String)
//                //  }
//                //  if let document = document, document.exists {
//                //  let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                // callerData.append(dataDescription["fName"] as! String )
//                //   callerData.append(dataDescription["number"] as! String )
//                //                    print("Document data: \(dataDescription)")
//                //                } else {
//                //                    print("Document does not exist")
//                //                }
//            }
//        }
//    }
////
////        db.collection("contacts").addSnapshotListener { (querySnapshot, error) in
////            guard let documents = querySnapshot?.documents else {
////                print ("No documents")
////                return
////            }
////            self.contacts = documents.map { (queryDocumentSnapshot) -> Contact in
////                let data = queryDocumentSnapshot.data ()
////                let name = data[ "name"] as? String ?? ""
////                return Contact (name: name)
////            }
////        }
//
//
//    func addData (item: [],lName: String,company: String,number: String,email: String) {
//
//
//        let docData: [String: Any] = [
//            "fName": fName,
//            "lName": lName,
//            "company": company,
//            "number": number,
//            "email": email
//
//        ]
//        db.collection("customer").document(fName).setData(docData){ error in
//            if let error = error {
//                print (error.localizedDescription)
//            } else {
//                    print("Document successfully written!")
//                }
//        }
//    }
//    //id: UUID,
//    func updateData( fName: String,lName: String,company: String,number: String,email: String){
//
//        let washingtonRef = db.collection("contacts").document(fName)
//
//
//        washingtonRef.updateData([
//           // "id": id,
//            "fName": fName,
//            "lName": lName,
//            "company": company,
//            "number": number,
//            "email": email
//        ]) { err in
//            if let err = err {
//                print("Error updating document: \(err)")
//            } else {
//                print("Document successfully updated")
//            }
//        }
//    }
//
}

