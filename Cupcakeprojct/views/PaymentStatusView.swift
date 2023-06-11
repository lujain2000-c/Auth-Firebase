//
//  PaymentStatusView.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//

import SwiftUI

struct PaymentStatusView: View {
    var body: some View {
       
            ZStack{
                Color("Beige")
                VStack{
                    Text("Payment status")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("Brown"))
                        .padding(.trailing,70)
                        .padding(.bottom,50)
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 100,height: 100)
                        .foregroundColor(.green)
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 350,height: 370)
                            .cornerRadius(30)
                            .foregroundColor(Color("White"))
                        
                        VStack{
                            Text("Payment in progress")
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color("Brown"))
                                .padding(.bottom,30)
                            HStack{
                                Text("Data")
                                Spacer()
                                Text("20 Oct 2022")
                                    .bold()
                            }.foregroundColor(Color("Brown"))
                                .padding(.bottom)
                            HStack{
                                Text("Payment method")
                                Spacer()
                                Text("ApplePay")
                                    .bold()
                            }.foregroundColor(Color("Brown"))
                                .padding(.bottom)
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
                                Text("Free")
                                    .bold()
                            }.foregroundColor(Color("Brown"))
                                .padding(.bottom)
                            Divider()
                            //.foregroundColor(.blue)
                            HStack{
                                Text("Total")
                                Spacer()
                                Text("$12.90")
                                
                            }.foregroundColor(Color("Brown"))
                                .bold()
                                .padding(.bottom)
                            
                        }.padding(.horizontal,40)
                    }
                    Spacer()
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color("Brown"))
                            .frame(width: 320,height: 50)
                            .cornerRadius(10)
                        NavigationLink("Back to Home", destination: ContentView())
                            .navigationBarBackButtonHidden(true)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        
                    }.padding(.bottom,40)
                }.padding(.top,80)
            }.ignoresSafeArea()
      
    }
}

struct PaymentStatusView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentStatusView()
    }
}
