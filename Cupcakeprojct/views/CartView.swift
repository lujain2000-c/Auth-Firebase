//
//  CartView.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//

import SwiftUI

struct CartView: View {
    @ObservedObject  var vm = CartViewModel()
    var body: some View {
        ZStack{
            Color("Beige")
            VStack{
//                Image(systemName: "chevron.backward")
//                    .resizable()
//                    .frame(width: 10, height: 20)
//                    .foregroundColor(Color("Brown"))
//                    .padding(.trailing,320)
                    //.padding(.bottom)
                Text("My cart")
                    .font(.largeTitle)
                     .bold()
                     .foregroundColor(Color("Brown"))
                     .padding(.trailing,200)
                     .padding(.bottom, 50)
                ForEach(vm.allItem){item in
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color("Brown"))
                            .frame(width: 320,height: 140)
                            .cornerRadius(16)
                            .shadow(radius: 20)
                        HStack{
//                            Image(item.image)
//                                .resizable()
//                              .frame(width: 100,height: 100)
//                              .padding(.leading,40)
                            VStack{
                                Text(item.name)
                                    .padding(.bottom)
                                Text("$\(item.price, specifier: "%.2f")")
                                    .font(.custom("SnellRoundhand-Bold", size: 24))
                                    .padding(.trailing,80)
                            }.foregroundColor(.white)
                                .bold()
                                
                            ZStack{
                                Rectangle()
                                    .frame(width: 35,height: 70)
                                    .foregroundColor(Color("Beige"))
                                    .padding(.trailing)
                                    .cornerRadius(8)
                                
                               VStack{
                                  ZStack{
                                       Rectangle()
                                           .frame(width: 35,height: 32)
                                            .foregroundColor(.white)
                                           .padding(.trailing)
                                           .cornerRadius(8)
                                        Button(" + "){
                                           vm.add()
                                      }.padding(.trailing)                                          .foregroundColor(Color("Brown"))
                                      
                                  }.padding(.top)
                                      
                                   Text("\(vm.counter)") //
                                       .font(.caption)
                                       .padding(.trailing)
                                   ZStack{
                                       Rectangle()
                                           .frame(width: 35,height: 32)
                                          .foregroundColor(.white)
                                           .padding(.trailing)
                                            .cornerRadius(8)
                                         Button(" - "){
                                             if vm.counter <= 1{
                                                 let name = item.name
                                                 let price = item.price
                                                // let image = item.image
                                                 vm.removeFromCart(itemName: name ,itemPrice: price)
                                             
                                             }else{
                                                 vm.delete()
                                             }
                                        }.padding(.trailing)
                                        .foregroundColor(Color("Brown"))
                                     
                                   }
                              }
                            }.padding(.trailing,30)
                        }
                            
                   }
                    
                }
                Spacer()
                Spacer()
                ZStack{
                    Rectangle()
                        .frame(height: 250)
                        .foregroundColor(Color("White"))
                        
                    VStack{
                        HStack{
                            Text("Subtotale")
                            Spacer()
                            Text("$\(Double(vm.counter) * 12.90, specifier: "%.2f")")
                                .bold()
                        }.foregroundColor(Color("Brown"))
                            .padding(.bottom)
                        HStack{
                            Text("Delivery")
                            Spacer()
                            Text("Free")
                                .bold()
                        }.foregroundColor(Color("Brown"))
                        Divider()
                            //.foregroundColor(.blue)
                        HStack{
                            Text("Total")
                            Spacer()
                            Text("$\(Double(vm.counter) * 12.90, specifier: "%.2f")")
                              
                        }.foregroundColor(Color("Brown"))
                            .bold()
                            .padding(.bottom)
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color("Brown"))
                                .frame(width: 320,height: 50)
                                .cornerRadius(10)
                            NavigationLink("Chekout", destination: PaymentView())
                                .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                    .navigationTitle(" ")
                        
                        }
                    }.padding(.horizontal,40)
                }.ignoresSafeArea()
            }.padding(.top,80)
        }.ignoresSafeArea()
    }
    
    
   
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
