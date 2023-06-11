//
//  SignUpView.swift
//  Cupcakeprojct
//
//  Created by لجين إبراهيم الكنهل on 21/11/1444 AH.
//




import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct SignUpView: View {
    @ObservedObject var emailObj = EmailValidationobj()
    @ObservedObject var passObj = PasswordValidationObj()
    
    @State var email = ""
    @State var fullName = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var phoneNumber = ""
    @State var userIsAuth = false
    @State var tag : Int? = nil
    
    var body: some View {
        NavigationStack{
            
            ZStack {
                Color("Beige")
              
                VStack{
                    Text("Sign up")
                        .bold()
                        .padding(.trailing,275)
                        .padding(.top,10)
                    
                    HStack{
                        Text("Hi,")
                        Text("Welcom!")
                            .foregroundColor(Color("Brown"))
                    }
                        .font(.largeTitle)
                        .bold()
                        .padding(.trailing,145)
                        .padding(.top)
                    Text("Please sign up to continue")
                        .font(.footnote)
                        .padding(.trailing,170)
                        .padding(.bottom,30)
                    
                    ScrollView {
                        VStack(spacing: 15){
                            ZStack{
                                Color(.white)
                                    .frame(width: 330,height: 55)
                                    .shadow(radius: 7)
                               // Form{
                                VStack(spacing: 5){
                                    Text("Full name")
                                        .font(.footnote)
                                        .bold()
                                        .padding(.trailing,260)
                                        .padding(.leading,10)
                                    TextField("Enter a Full name",text: $fullName)
                                        .textContentType(.username)
                                    //.keyboardType(.emailAddress)
                                        .foregroundColor(.gray)
                                        .font(.footnote)
                                    
                                        .foregroundColor(.gray)
                                        .padding(.leading,40)
                                }//.padding(.leading,10)
                            }
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
                                    TextField("Enter an Email",text: $email)
                                        .textContentType(.emailAddress)
                                   .keyboardType(.emailAddress)
                                    Text(emailObj.error).foregroundColor(.red)
                                    //.font(.footnote)
                                        .foregroundColor(.gray)
                                        .padding(.leading,40)
                                    
                                }//.padding(.leading,10)
                            }
                            ZStack{
                                Color(.white)
                                    .frame(width: 330,height: 55)
                                    .shadow(radius: 7)
                                
                                VStack(spacing: 5){
                                    Text("Phone number")
                                        .font(.footnote)
                                        .bold()
                                        .padding(.trailing,235)
                                        .padding(.leading,10)
                                    TextField("Enter Phone number",text: $phoneNumber)
                                    .textContentType(.telephoneNumber)
                                        .keyboardType(.namePhonePad)
                                    //.font(.footnote)
                                        .foregroundColor(.gray)
                                        .padding(.leading,40)
                                    
                                }//.padding(.leading,10)
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
                                    Text(passObj.error).foregroundColor(.red)
                                }
                            }
                            
                            ZStack{
                                Color(.white)
                                    .frame(width: 330,height: 55)
                                    .shadow(radius: 7)
                                
                                VStack(spacing: 5){
                                    Text("Confirm password")
                                        .font(.footnote)
                                        .bold()
                                        .padding(.trailing,190)
                                    SecureField( "Enter a Confirm password",text: $confirmPassword)
                                        .textContentType(.password)
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                    
                                        .foregroundColor(.gray)
                                        .padding(.leading,44)
                                }
                            }
                            
                        }
                       
                        ZStack{
                            Color("Brown")
                            
                                .frame(width: 100,height: 30)
                          
                                HStack(spacing: 7){
                                    
                                    NavigationLink(destination: ContentView()){
                                        Button("SIGN UP"){
                                            
                                            if  password == "" || email == "" || fullName == "" || confirmPassword == "" || confirmPassword != password {
                                                HapticManager.instance.impact (style: .heavy)
                                                
                                               
                                            }else{
                                                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                                                    if  error != nil {
                                                        print(error!.localizedDescription)
                                                        
                                                    }
                                                    
                                                    
                                                }
                                                
                                            }
                                        }
                                        
                                    }.font(.footnote)
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .frame(width: 10,height: 10)
                                }.foregroundColor(.white)
                                    .bold()
                             
                                
                            }.padding(.bottom,30)
                                .padding(.leading,240)
                                .foregroundColor(.white)
                        
                        HStack{
                                                    Text("Already have account?")
                                                    NavigationLink("sign in", destination: LogInView())
                                                        .foregroundColor(Color("Brown"))
                                                        //.bold()
                                                }.padding(.bottom,150)
                                                
                    }
                }.padding(.top,150)
            }.ignoresSafeArea()
        }
    }
    
//    func isValidEmail(email:String?) -> Bool {
//        
//        guard email != nil else { return false }
//        
//        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        
//        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
//        return pred.evaluate(with: email)
//    }
//    
//    
//    func isValidPassword(testStr:String?) -> Bool {
//        guard testStr != nil else { return false }
//
//        // at least one uppercase,
//        // at least one digit
//        // at least one lowercase
//        // 8 characters total
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
//        return passwordTest.evaluate(with: testStr)
//    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


class HapticManager {
static let instance = HapticManager ()

func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
let generator = UIImpactFeedbackGenerator(style: style)
generator.impactOccurred()
}
}

class EmailValidationobj: ObservableObject{
    @Published var email = "" {
        didSet {
            if self.email.isEmpty {
                self.error = "Required"
            } else if !self.email.isValidEmail() {
                self.error = "Invalid email"
            } else {
                self.error = ""
            }
        }
    }
    @Published var error = ""
    
    }

class PasswordValidationObj: ObservableObject{
    @Published var pass = "" {
        didSet{
            self.isValidPassword()
        }
    }
    
    @Published var error = ""
    
    private func isValidPassword () {
        guard !self.pass.isEmpty else {
            self.error = "Required"
            return
        }
        
        let setPassError = self.pass.isPassword() == false
        
        if setPassError {
            if self.pass.count < 8 {
                self.error = "Must be at least 8 characters"
            }
            if !self.pass.isUpperCase () {
                self.error = "Must contain at least one uppercase.!"
            }
            if !self.pass.isLowerCase() {
                self.error = "Must contain at least one lowerCase.!"
            }
            
        }else{
            self.error = ""
        }
    }
}
extension String{
    func isValidEmail () -> Bool {
        let emailRegEx = #"^\S+@\S+\.\S+$"#
        // One or more characters followed by an "@",
        // then one or more characters followed by a ".",
        // and finishing with one or more characters

        // Matching Examples
        // user@domain.com
        // firstname.lastname-work@domain.com
        let emailValidation = NSPredicate (format: "SELF MATCHES[c] %@", emailRegEx)
        return emailValidation.evaluate (with: self)
    }
    func isPassword() -> Bool {
        let passwordRegex =
        "^(?=.*[0-91)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<]{‹6,}$"
        let passwordPred = NSPredicate( format: "SELF MATCHES %@", passwordRegex)
        return passwordPred.evaluate (with: self)
    }
    func isUpperCase () -> Bool {
        let uppercaseReqRegex = ".*[A-Z]+.*"
        return NSPredicate(format:"SELF MATCHES %@", uppercaseReqRegex).evaluate(with: self)
    }
    
    func isLowerCase() -> Bool {
        let lowercaseReqRegex = ".*[a-z]+.*"
        return NSPredicate(format: "SELF MATCHES %@", lowercaseReqRegex).evaluate(with: self)
        
    }
    
    func containsCharacter() -> Bool {
        let characterReqRegex = ".*[!@#$%^&*()\\-_=+{}|?>.<]+.*"
        return NSPredicate( format: "SELF MATCHES %@", characterReqRegex).evaluate (with: self)
    }
    func containsDigit () -> Bool {
    let digitReqRegex = ".*[0-9]+.*"
    return NSPredicate(format: "SELF MATCHES %@", digitReqRegex) .evaluate(with: self)
    }
}






