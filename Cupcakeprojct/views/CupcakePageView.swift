//
//  CupcakePageView.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//

import SwiftUI

struct CupcakePageView: View {
    @ObservedObject var vmCart = CartViewModel()
    @ObservedObject var vm = CupcakePageViewModel()
    var body: some View {
        ZStack{
          
            Color("Brown")
            VStack{
                Image(systemName: "chevron.backward")
                    .resizable()
                    .frame(width: 10, height: 20)
                    .foregroundColor(.white)
                    .padding(.trailing,360)
                    .padding(.bottom,16)
                
                Image(vm.cupcakeInfo.image)
                   // .padding(.bottom)
                ZStack{
                    Rectangle()
                        .cornerRadius(40)
                        .foregroundColor(Color("Beige"))
                    VStack{
                        Text(vm.cupcakeInfo.name)
                            .font(.custom("SnellRoundhand-Black", size: 30))
                            .bold()
                            .padding(.top,24)
                            .padding(.bottom,7)
                            
                          Text("Ingredients:")
                            .font(.title3)
                            .bold()
                            .padding(.bottom,5)
                            .padding(.trailing, 230)
                        Text("Butter, sugar, milk, cocoa, eggs, baking").padding(.trailing,40)
                        Text("powder, flour, dark chocolate, caramel,").padding(.trailing,40)
                        Text("cream, buttermilk, coffee.").padding(.trailing,140)
                        
                        HStack{
                            ForEach(vm.allFacts){ fact in
                                ZStack{
                                    Color("Brown")
                                        .frame(width: 75,height: 120)
                                        .cornerRadius(40)
                                    VStack{
                                        ZStack{
                                            Rectangle()
                                                .frame(width: 50,height: 50)
                                                .cornerRadius(25)
                                                .foregroundColor(.white)
                                            Text("\(fact.value, specifier: "%.1f")")
                                                .bold()
                                            
                                        }.padding(.bottom)
                                        
                                        Text(fact.name)
                                            .foregroundColor(.white)
                                            .bold()
                                            .font(.footnote)
                                    }
                                }.padding(.trailing)
                                    //.shadow(radius: 8)
                                    
                                
                            }
                        }.padding(.top)
                            .padding(.leading)
                           
                        VStack(spacing: 0){
                            HStack{
                                Text("$\(vm.cupcakeInfo.price, specifier: "%.2f")")
                                    .font(.custom("SnellRoundhand-Bold", size: 40))
                                    .bold()
                                
                                .foregroundColor(Color("Brown"))
                                Text("/6pes")
                                    .font(.custom("SnellRoundhand-Bold", size: 16))
                                    .bold()
                                .foregroundColor(Color("Brown"))
                            }.padding(.trailing,200)
                            
                            ZStack{
                                Rectangle()
                                    .foregroundColor(Color("Brown"))
                                    .frame(width: 320,height: 50)
                                    .cornerRadius(10)
                                  
                                Button("Add to cart"){
                                    let name = vm.cupcakeInfo.name
                                    let price = vm.cupcakeInfo.price
                                    let image = vm.cupcakeInfo.image
                                    vm.addData(item: name ,price: price ,image: image)
                                    
                                    
                                }.font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                   
                                
                            } .padding(.bottom,150)
                        }
                    }
                    
                }
            }.padding(.top,150)
               // .padding(.horizontal,300)
               
                
        }.ignoresSafeArea()
        
        
    }
}

struct CupcakePageView_Previews: PreviewProvider {
    static var previews: some View {
        CupcakePageView()
    }
}
