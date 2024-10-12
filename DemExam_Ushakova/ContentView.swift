//  Вьюшка для первой страницы Sign Up
//
//  ContentView.swift
//  Page "Sign UP"
//
//  Created by Ушакова Антонина Андреевна on 12.10.2024.
// ghjdthrf ghjdthrf
//87y7yg79gf7tf7tf7tftf

import SwiftUI

//  для проверки валидации пароля
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

struct ContentView: View {
    @State var name: String = ""
    @State var PhoneNumber: String = ""
    @State var MailAddress: String = ""
    @State var Pass: String = ""
    @State var ConfPass: String = ""
    @State private var checkBox: Bool = false
    @State private var isShowingDetailView = false
    @State var isShowAlert = false
    @State var isShowAlert2 = false
    @StateObject var userViewModel = UserViewModel()
    //@State var condition: Bool = true
    @State var isShowingPassword: Bool = false
    @State var isShowingPassword2: Bool = false
    //

    var body: some View {
        NavigationView{
            ZStack{
                Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack (alignment: .leading ){
                    
                    
                    Text("Create an account")
                        .font(.custom("Roboto", size: 24))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.headerBlack)
                        .padding(.bottom, 15)
                    
                    Text("Complete the sign up process to get started")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text("Full name")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.top, 15)
                    
                    TextField("Ivanov Ivan", text: $userViewModel.user.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 14)
                        .alert(isPresented: $isShowAlert) {
                                    Alert(title: Text("Not all fields are filled in"),
                                          dismissButton: .default(Text("OK")))
                                }
                
                    Text("Phone number")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    TextField("79999999999", text: $userViewModel.user.PhoneNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 14)
                    
                    Text("Email Address")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    TextField("***********@mail.com", text: $userViewModel.MailAddress)
                    
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 1)
                            .padding(.top, 1)
                            .padding(.trailing, 1)
                            .padding(.leading, 1)
                            .textContentType(.emailAddress)       // !IMPORTANT FOR EMAILS
                                .disableAutocorrection(true)          // !IMPORTANT FOR EMAILS
                                .textInputAutocapitalization(.never)  // !IMPORTANT FOR EMAILS
                                .background(userViewModel.MailAddress.isValidEmail ? .success : .error)
                                .cornerRadius(6.0)
                    
                    Text("Password")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.top, 14)
                    
                    
                    VStack {                                                        //отображение пароля работает по принципу
                                Group {
                                    if isShowingPassword {                          //если пароль необходимо отобразить
                                        TextField("********", text: $userViewModel.password) // то будет TextField
                                    }else {                                         //если нужны точки вместо букв и цифр
                                        SecureField("********", text: $userViewModel.password)// поле будет SecureField
                                    }
                                }
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom, 14)
                                
                                .overlay(Button {
                                    isShowingPassword.toggle()
                                }label: {
                                    if isShowingPassword {
                                        Image(.eye)
                                    }else {
                                        Image(.eyeSlash)
                                    }
                                }.padding(.bottom, 10) .padding(.trailing, 5), alignment: .trailing )
                            }
                    

                    
                    Text("Confirm Password")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                    
                    VStack {
                                Group {
                                    if isShowingPassword2 {
                                        TextField("********", text: $userViewModel.user.ConfPass)
                                    }else {
                                        SecureField("********", text: $userViewModel.user.ConfPass)
                                    }
                                }
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.bottom, 14)
                                
                                .overlay(Button {
                                    isShowingPassword2.toggle()
                                }label: {
                                    if isShowingPassword2{
                                        Image(.eye)
                                    
                                    }else {
                                        Image(.eyeSlash)
                                    }
                                }.padding(.bottom, 10) .padding(.trailing, 5), alignment: .trailing )
                            }
                    .padding(.bottom, 30)
                    
                    
                    HStack (alignment: .center){
                        CheckBox(value: $checkBox)
                            .alert(isPresented: $isShowAlert2) {
                                        Alert(title: Text("Agree 'Terms and conditions and private policy'"),
                                              dismissButton: .default(Text("OK")))
                                    }
                        
                        NavigationLink {
                            PDFKitView()
                        } label: {
                            Text("\(Text("By ticking this box, you agree to our").foregroundColor(Color.svetGray)) \(Text("Terms and conditions and private policy").foregroundColor(Color.swwYellow))")
                                .font(.custom("Roboto", size: 14))
                        }
                        
                        
                    }
                    .padding(.bottom, 30)
                    .padding(.leading, 5)
                    
                    Spacer()
                    
                    VStack(alignment: .center){
                        
                        Button(action:
                                {
                            
                            if checkBox {
                                isShowingDetailView.toggle()
                                userViewModel.signUp()
                            }
                            else
                            {
                                isShowAlert2.toggle()
                                if userViewModel.user.name == "" || userViewModel.user.PhoneNumber == "" || userViewModel.MailAddress == "" || userViewModel.password == "" || userViewModel.user.ConfPass == ""{
                                    isShowAlert.toggle()
                                    }
                            }
                            })
                        {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .padding(.horizontal, 140)
                                .padding(.vertical, 15)
                                .background(Color.svetGray)
                                .cornerRadius(4.0)
                                .font(.custom("Roboto", size: 16))
                                .bold()
                                
                        }
                        
                        NavigationLink(destination: SecondPage(), isActive: $isShowingDetailView ){
                            
                        }
                        
                        HStack{
                            Text("Already have an account?")
                            
                            
                            Button(action:
                                    { isShowingDetailView.toggle()})
                            {
                                Text("Sign In")
                                    .foregroundColor(.intBlue)
                                    .bold()
                            }

                        }
                        .padding(.top, 10)
                        Text("or sign in using")
                        Image(.googleIcon)

                    } .frame(maxWidth: .infinity)
                  
                }
                .padding(.leading, 24)
                .padding(.trailing, 24)
                .background(.white)
                .foregroundColor(.svetGray)
                .font(.custom("Roboto", size: 14))
            }
            
        }
        .navigationBarHidden(true)
    }
}

struct CheckBox: View {   //кастомный чек-бокс
    @Binding var value: Bool
    var body: some View {
        Group {
            if value {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                    .overlay {
                        if value {
                            Image(systemName: "checkmark")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }
            }
            else {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.accentColor, lineWidth: 2)
                    .frame(width: 14, height: 14)
            }
        }
        .onTapGesture {
            self.value.toggle()
        }
    }
}


#Preview {
    ContentView()
}

