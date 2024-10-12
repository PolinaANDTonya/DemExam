//
//  для различных функций, связанных с Supabse
//
//  UserViewModel.swift
//  DemExam_Ushakova
//
//  Created by Ушакова Антонина Андреевна on 12.10.2024.
//

import Foundation

class UserViewModel: ObservableObject{
    
    @Published var user = Registration(id: UUID(), name: "", PhoneNumber: "", MailAddress: "", Pass: "", ConfPass: "")
    
    @Published  var MailAddress: String = ""
    @Published  var password: String = ""
    @Published  var confirmPassword: String = ""
    
    @Published  var isProgress: Bool = false
    @Published  var isNavigate: Bool = false
    @Published  var error: Bool = false
    
    @Published var code: [String] = Array(repeating: "", count: 6)
    
    func signUp() {    //функция для регистрации
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await Repositories.instance.signUp(name: user.name, PhoneNumber: user.PhoneNumber, MailAddress: MailAddress, Pass: password, ConfPass: confirmPassword)
                await MainActor.run {
                    self.isNavigate = true
                    self.isProgress = false
                }
            } catch {
                print("ERROR: " + error.localizedDescription)
                await MainActor.run {
                    self.error = true
                    self.isProgress = false
                }
            }
        }
    }
    
    func signIn () {  //функция для авторизации
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                self.isNavigate = false
                try await Repositories.instance.signIn (MailAddress: MailAddress, Pass: password)
                await MainActor.run {
                    self.isNavigate = true
                    self.isProgress = false
                }}
            catch {
                print("ERROR: " + error.localizedDescription)
                await MainActor.run {
                    self.error = true
                    self.isProgress = false
                }
            }
        }
    }
    
    func resetPasword () {    //функция для сброса пароля
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                self.isNavigate = false
                try await Repositories.instance.resetPasword(MailAddress: MailAddress)
                await MainActor.run {
                    self.isNavigate = true
                    self.isProgress = false
                }}
            catch {
                print("ERROR: " + error.localizedDescription)
                await MainActor.run {
                    self.error = true
                    self.isProgress = false
                }
            }
        }
    }
    
    func send() {    //функция для отправки кода восстановления
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                }
                try await Repositories.instance.sendOTP(MailAddress: MailAddress, code: code.joined())
                
                await MainActor.run {
                    self.isNavigate = true
                    self.isProgress = false
                }
            } catch {
                print(error.localizedDescription)
                await MainActor.run {
                    self.error = true
                    self.isProgress = false
                    //self.anotherError = true
                }
            }
        }
    }
    
}
