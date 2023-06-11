//
//  CupcakeModel.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//

import SwiftUI


struct CupcakeModel: Identifiable{
 var id = UUID()
    var name: String
    var imageName: String
    var price: Double
    var category: String
}

struct CategoryModel: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var color: Color
}
