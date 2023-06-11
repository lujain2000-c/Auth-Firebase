//
//  LogInView.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//

import SwiftUI
import FirebaseAuth

struct LogInView: View {
    
    @ObservedObject var loginEmailObj = EmailValidationobj()
    @ObservedObject var loginPassObj = PasswordValidationObj()
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack{
            
            ZStack {
                Color("Beige")
                
                VStack{
                    Text("Sign in")
                        .bold()
                        .padding(.trailing,275)
                        .padding(.top,10)
                    
                    HStack{
                        Text("Hi,")
                        Text("GOOD DAY!")
                            .foregroundColor(Color("Brown"))
                    }
                    .font(.largeTitle)
                    .bold()
                    .padding(.trailing,105)
                    .padding(.top)
                    Text("Please sign in to continue")
                        .font(.footnote)
                        .padding(.trailing,170)
                        .padding(.bottom,30)
                    VStack(spacing: 10){
                        
                        ZStack{
                            Color(.white)
                                .frame(width: 330,height: 55)
                                .shadow(radius: 7)
                            
                            VStack(spacing: 5){
                                Text("Email")
                                    .font(.footnote)
                                    .bold()
                                    .padding(.trailing,290)
                                    .padding(.leading,10)
                                TextField("Enter a Email",text: $email)
                                    .textContentType(.emailAddress)
                                .keyboardType(.emailAddress)
                                //.font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.leading,40)
                                Text(loginEmailObj.error).foregroundColor(.red)
                                
                            }.padding(.top)
                        }
                        
                        ZStack{
                            Color(.white)
                                .frame(width: 330,height: 55)
                                .shadow(radius: 7)
                            
                            VStack(spacing: 5){
                                Text("Password")
                                    .font(.footnote)
                                    .bold()
                                    .padding(.trailing,247)
                                SecureField("Enter a password", text: $password)
                                    .textContentType(.password)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .foregroundColor(.gray)
                                    .padding(.leading,40)
                                Text(loginPassObj.error).foregroundColor(.red)
                                
                            }.padding(.top)
                        }
                     
                        ZStack{
                            Color("Brown")
                            
                                .frame(width: 100,height: 30)
                           
                                HStack(spacing: 7){
                                    NavigationLink(destination: ContentView()){
                                        Button("LogIn"){
                                            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                                                if  error != nil {
                                                    print(error!.localizedDescription)
                                                    
                                                }
                                            }
                                        }.font(.footnote)
                                        
                                        Image(systemName: "arrow.right")
                                            .resizable()
                                            .frame(width: 10,height: 10)
                                        
                                    }
                                    
                                }.foregroundColor(.white)
                                    .bold()
                                
                                
                                
                            }//.padding(.bottom,30)
                            .padding(.top,40)
                            .padding(.leading,240)
                            .foregroundColor(.white)
                            .padding(.bottom,80)
                            
                        
                        
                        HStack{
                            Text("Don't have an account?")
                            NavigationLink("sign up", destination: SignUpView())
                                .foregroundColor(Color("Brown"))
                        }
                        
                        .padding(.top,130)
                    }
                }
            }.ignoresSafeArea()
        }
    }
    

}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
