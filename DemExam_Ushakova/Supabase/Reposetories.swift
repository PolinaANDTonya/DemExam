
// Тоже для работы с функциями Supabase
=======

//
//  Reposetories.swift
//  DemExam_Ushakova
//

//  Created by Ушакова Антонина Андреевна on 12.10.2024.
//

import Foundation
import Supabase

class Repositories {
              // паттерн instance
    static let instance = Repositories()

    // подключение supabase
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://ugkjtcanhjjjwbbhwgbi.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVna2p0Y2FuaGpqandiYmh3Z2JpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0Mzg3NTUsImV4cCI6MjA0NDAxNDc1NX0.it7XMiUoWYyeEy5V-JNiLDSv2U3UD-kN_DDvQEuSYkc",
        options: .init())
    
    func signUp(name: String, PhoneNumber: String, MailAddress: String, Pass: String, ConfPass: String) async throws {  //функция для регистрации

        try await supabase.auth.signUp(email: MailAddress, password: Pass)
        
        let user = try await supabase.auth.session.user
        
        let newUser = Registration(id: user.id, name: name, PhoneNumber: PhoneNumber, MailAddress: MailAddress, Pass: Pass, ConfPass: ConfPass)
        
        try await supabase.from("FirstTry1")
            .insert(newUser)
            .execute()
        //djkj
        try await supabase.auth.signOut()
    }
    
    func signIn (MailAddress: String, Pass: String) async throws {                                                      //функция для авторизации
            try await supabase.auth.signIn(email: MailAddress, password: Pass)
        }
    
    func resetPasword(MailAddress: String) async throws {                                                               //функция для сброса пароля
        try await supabase.auth.resetPasswordForEmail(MailAddress)
}
    
    func sendOTP(MailAddress: String, code: String) async throws {                                                      //функция для отправки кода
        try await supabase.auth.verifyOTP(email: MailAddress, token: code, type: .recovery)
    }
    
                                                                                                                        // установка нового пароля в supabase
    func setNewPassword(Pass: String) async throws {
        try await supabase.auth.update(user: .init(password: Pass))
    }
    
    
    }




//  Created by User on 12.10.2024.
//

import Foundation

