//
//  PaymentView.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//

import SwiftUI

struct PaymentView: View {
    @StateObject var vm = PaymentViewModel()
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
                Text("Payment method")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("Brown"))
                    .padding(.trailing,70)
                    .padding(.bottom,50)
                VStack(spacing: 20){
                    
                    ForEach(vm.allMethods){method in
                        
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 320,height: 80)
                                .cornerRadius(16)
                                .shadow(radius: 5)
                            HStack{
                                Image(method.image)
                                    .resizable()
                                    .frame(width: 80,height: 50)
                                    .padding(.leading, 50)
                                    .padding(.trailing)
                                
                                
                                    Text(method.name)
                                        .padding(.bottom)
                                    .foregroundColor(.black)
                                    .bold()
                                Spacer()
                                Circle()
                                    .stroke()
                                    .frame(width: 20,height: 20)
                                    .padding(.trailing,50)
                                    
                                
                            }.padding(.trailing)
                        }
                    }
                }
                .padding(.bottom,70)
                Spacer()
                ZStack{
                    Rectangle()
                        .frame(height: 250)
                        .foregroundColor(Color("White"))
                        
                    VStack{
                        HStack{
                            Text("Transfer amount")
                            Spacer()
                            Text("$12.90")
                                .bold()
                        }.foregroundColor(Color("Brown"))
                            .padding(.bottom)
                        HStack{
                            Text("Additional cost")
                            Spacer()
                            Text("$1.94")
                                .bold()
                        }.foregroundColor(Color("Brown"))
                        Divider()
                            //.foregroundColor(.blue)
                        HStack{
                            Text("Total")
                            Spacer()
                            Text("$14.34")
                              
                        }.foregroundColor(Color("Brown"))
                            .bold()
                            .padding(.bottom)
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color("Brown"))
                                .frame(width: 320,height: 50)
                                .cornerRadius(10)
                            NavigationLink("Pay", destination: PaymentStatusView())
                                .navigationTitle(" ")
                                .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                   
                                 
                        
                            
                        }.padding(.top,30)
                        
                    }.padding(.horizontal,40)
                }.ignoresSafeArea()
            }.padding(.top,80)
        }.ignoresSafeArea()
    }
}
struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
