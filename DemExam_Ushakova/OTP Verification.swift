//
//  OTP Verification.swift
//  DemExam_Ushakova
//
//  Created by Ушакова Антонина Андреевна on 12.10.2024.
//

import SwiftUI

struct OTP_Verification: View {
    @State private var checkBox: Bool = false
    @State private var isShowingDetailView = false
    @State var Code: String = ""
    @State private var isShowAlert = false
    @StateObject var userViewModel = UserViewModel()
    @State private var first: String = ""
    @State private var sec: String = ""
    @State private var third: String = ""
    @State private var fourth: String = ""
    @State private var fifth: String = ""
    @State private var six: String = ""
    @State private var vvedeno: String = ""
    @State var count: Int = 60
    @State private var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var code: [String] = Array(repeating: "", count: 6)
    @State private var anotherError: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack (alignment: .leading ){
                    
                    Text("OTP Verification")
                        .font(.custom("Roboto", size: 24))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.headerBlack)
                        .padding(.bottom, 15)
                    
                    Text("Enter the 6 digit numbers sent to your email")
                        .font(.custom("Roboto", size: 14))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    
                    HStack(){
                        
                        TextField("", text: $first)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 7)
                            .padding(.trailing, 7)
                        Spacer()
                        TextField("", text: $sec)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 7)
                            .padding(.trailing, 7)
                        Spacer()
                        TextField("", text: $third)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 7)
                            .padding(.trailing, 7)
                        Spacer()
                        TextField("", text: $fourth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 7)
                            .padding(.trailing, 7)
                        Spacer()
                        TextField("", text: $fifth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 7)
                            .padding(.trailing, 7)
                        Spacer()
                        TextField("", text: $six)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 7)
                            .padding(.trailing, 7)
                        
                    }
                    .padding(.top, 40)
                    
                    HStack(alignment: .center){
                        Text("If you didn’t receive code,")
                            .font(.custom("Roboto", size: 14))
                        
                        if count > 0 {
                            Text("resend after \(count == 60 ? "1:00" : count > 9 ? "0:\(count)" : "0:0\(count)")")
                                .font(.custom("Roboto", size: 14))
                        }
                        }
                    .font(.custom("Roboto", size: 14))
                    .foregroundStyle(Color.svetGray)
                    .padding(.top, 20)
                    
                    
                    VStack(alignment: .center){
                        
                        Button(action: {print ("Работаем")
                            
                            if (first + sec + third + fourth + fifth + six) == ""
                            {
                                isShowAlert = true
                            }
                            else
                            {
                                isShowingDetailView = true
                            }
                        } ){
                            
                            Text("Set New Password")
                                .foregroundColor(.white)
                                .padding(.horizontal, 100)
                                .padding(.vertical, 15)
                                .background(Color.svetGray)
                                .cornerRadius(4.0)
                                .font(.custom("Roboto", size: 16))
                                .bold()
                        }
                        .padding(.top, 70)
                        .alert(isPresented: $isShowAlert) {
                            Alert(title: Text("The code is not correct"),
                                  dismissButton: .default(Text("OK")))
                        }
                        
                        
                        NavigationLink(destination: New_Password(), isActive: $isShowingDetailView ){
                        }
                        
                        
                        
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
    OTP_Verification()
}
