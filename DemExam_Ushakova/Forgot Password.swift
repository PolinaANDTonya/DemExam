//  для экрана "Forgot Password"
//
//  Forgot Password.swift
//  DemExam_Ushakova
//
//  Created by Ушакова Антонина Андреевна on 12.10.2024.

import SwiftUI

struct ForgotPassword: View {
    @State var MailAddress: String = ""
    @State private var checkBox: Bool = false
    @State private var isShowingDetailView = false
    @State private var isShowingDetailView2 = false
    @State private var isShowAlert = false
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack (alignment: .leading ){
                    
                    Text("Forgot Password")
                        .font(.custom("Roboto", size: 24))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.headerBlack)
                        .padding(.bottom, 15)
                    
                    Text("Enter your email address")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    
                    Text("Email Address")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.top, 50)
                    
                    TextField("********@mail.com", text: $userViewModel.MailAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 14)
                    
                    .padding(.bottom, 30)
                    
                
                    VStack(alignment: .center){
                        
                        Button(action: {print ("Работаем")
                            
                            if userViewModel.MailAddress != "" {    //если поле не пустое
                                isShowingDetailView = true          //переменная для перехода на экран ОТП
                                userViewModel.resetPasword()        //запуск функции по сбросу пароля
                            }
                            else
                            {
                                isShowAlert.toggle()
                            }
                            
                            } ){
                            
                            Text("Send OTP")
                                .foregroundColor(.white)
                                .padding(.horizontal, 130)
                                .padding(.vertical, 15)
                                .background(Color.svetGray)
                                .cornerRadius(4.0)
                                .font(.custom("Roboto", size: 16))
                                .bold()
                                .alert(isPresented: $isShowAlert) {
                                            Alert(title: Text("Fill in 'Email Address'"),
                                                  dismissButton: .default(Text("OK")))
                                        }
                              
                        }
                        
                        
                        NavigationLink(destination: SecondPage(), isActive: $isShowingDetailView2 ){
                            
                        }
                        
                        NavigationLink(destination: OTP_Verification(), isActive: $isShowingDetailView ){
                            }
                        
                        HStack{
                            Text("Remember password? Back to")
                                
                            Button(action: {print ("Работаем")
                            isShowingDetailView2 = true} ){
                                
                            Text("Sign in")
                                    .foregroundColor(.intBlue)
                                    .bold()
                            }
                            
                        }
                        .padding(.top, 30)
                        
                        Spacer()


                    } .frame(maxWidth: .infinity)
                }
                .padding(.leading, 24)
                .padding(.trailing, 24)
                .background(.white)
                .foregroundColor(.svetGray)
                .font(.custom("Roboto", size: 14))
                .navigationBarHidden(true)
            }
        }
        .navigationBarHidden(true)
    }
}



#Preview {
    ForgotPassword()
}
