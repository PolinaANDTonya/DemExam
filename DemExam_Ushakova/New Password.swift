
//  верстка страницы "New Password"
=======

//
//  New Password.swift
//  DemExam_Ushakova
//

//  Created by Ушакова Антонина Андреевна on 12.10.2024.
=======
//  Created by User on 12.10.2024.
//


import SwiftUI

struct New_Password: View {

    
    @State var MailAddress: String = ""
    @State var Pass: String = ""
    @State private var isShowingDetailView = false
    @State var isShowAlert1 = false
    @State var isShowAlert2 = false
    @State private var checkBox: Bool = false
    @State private var isShowingDetailView2 = false
    @State private var isShowingDetailView3 = false
    @State var isShowingPassword1: Bool = false
    @State var isShowingPassword2: Bool = false
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack (alignment: .leading ){
                    
                    Text("New Password")
                        .font(.custom("Roboto", size: 24))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.headerBlack)
                        .padding(.bottom, 15)
                    
                    Text("Enter new password")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text("Password")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.top, 50)
                    
                   
                    VStack {                                    //принцип работыб как на первом экране
                                Group {
                                    if isShowingPassword1 {
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
                                    isShowingPassword1.toggle()
                                }label: {
                                    if isShowingPassword1{
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
                    
                    Text("Confirm Password")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    VStack {
                                Group {
                                    if isShowingPassword2 {
                                        TextField("********", text: $userViewModel.confirmPassword)
                                    }else {
                                        SecureField("********", text: $userViewModel.confirmPassword)
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
                    .alert(isPresented: $isShowAlert1) {
                        Alert(title: Text("Passwords do not match each other"),
                                      dismissButton: .default(Text("OK")))
                            }

                    .padding(.bottom, 30)
                    .padding(.leading, 5)
                    
                    Spacer()
                    
                    VStack(alignment: .center){    //проверки на "дурака"
                        
                        Button(action: { if userViewModel.password == "" || userViewModel.confirmPassword == ""{
                            isShowAlert2.toggle()
                        }
                            else {
                                if userViewModel.password != userViewModel.confirmPassword {
                                    isShowAlert1.toggle()
                                }
                                else {
                                    isShowingDetailView3.toggle()
                                }
                            }
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
                        
                            NavigationLink(destination: Home(), isActive: $isShowingDetailView3 ){
                          
                          }
                            
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
=======
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

    }
}

#Preview {
    New_Password()
}
