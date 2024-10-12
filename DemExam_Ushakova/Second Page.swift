// для экрана "Log in"
//
//  Second Page.swift
//  DemExam_Ushakova
//
//  Created by Ушакова Антонина Андреевна on 12.10.2024.
//

import SwiftUI

struct SecondPage: View {
    
    @State var MailAddress: String = ""
    @State var Pass: String = ""
    @State private var isShowingDetailView = false
    @State var isShowAlert = false
    @State var isShowAlert2 = false
    @State private var checkBox: Bool = false
    @State private var isShowingDetailView2 = false
    @State private var isShowingDetailView3 = false
    @State var isShowingPassword2: Bool = false
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View{
        NavigationView{
            ZStack{
                Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack (alignment: .leading ){
                    
                    Text("Welcome Back!")
                        .font(.custom("Roboto", size: 24))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.headerBlack)
                        .padding(.bottom, 15)
                    
                    Text("Fill in your email and password to continue")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text("Email Address")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.top, 30)
                    
                    TextField("***********@mail.com", text: $userViewModel.MailAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 14)
                    
                    Text("Password")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                   
                    VStack {                                                                                // принцип работы как на первом экране
                                Group {
                                    if isShowingPassword2 {
                                        TextField("********", text: $userViewModel.password)
                                    }else {
                                        SecureField("********", text: $userViewModel.password)
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
                                }.padding(.bottom, 5) .padding(.trailing, 5), alignment: .trailing )
                            }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 14)
                    .alert(isPresented: $isShowAlert2) {
                        Alert(title: Text("Not all fields are filled in"),
                                      dismissButton: .default(Text("OK")))
                            }

                    
                    HStack (alignment: .center){
                        CheckBox(value: $checkBox)
                        Text("Remember password")
                        Spacer()
                        
                        Button(action: {  isShowingDetailView2.toggle()
                            
                        })
                         {
                         Text("Forgot Password")
                         }
                         
                         .foregroundColor(.intBlue)
                         .bold()
                         
                           NavigationLink(destination: ForgotPassword(), isActive: $isShowingDetailView2 ){
                         
                         }
                    }
                    .padding(.bottom, 30)
                    .padding(.leading, 5)
                    
                    Spacer()
                    
                    VStack(alignment: .center){
                        
                        Button(action: { if userViewModel.password == ""{
                            isShowAlert2.toggle()
                        }
                            else {
                                //isShowingDetailView2.toggle()
                            }
                            userViewModel.signIn ()
                        })
                        {
                            Text("Log in")
                                .foregroundColor(.white)
                                .padding(.horizontal, 150)
                                .padding(.vertical, 15)
                                .background(Color.svetGray)
                                .cornerRadius(4.0)
                                .font(.custom("Roboto", size: 16))
                                .bold()
                        }
                        
                        
                        HStack{
                            Text("Already have an account?")
                            
                            Button(action: { isShowingDetailView3.toggle() })
                            {
                                Text("Sign up")
                                    .foregroundColor(.intBlue)
                                    .bold()
                            }
                            
                            NavigationLink(destination: Home(), isActive: $userViewModel.isNavigate ){
                          
                          }
                            NavigationLink(destination: ContentView(), isActive: $isShowingDetailView3 ){
                          
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

#Preview {
    SecondPage()
}

