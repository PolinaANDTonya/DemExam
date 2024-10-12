
// для глобальных переменных
=======

//
//  Registration.swift
//  DemExam_Ushakova
//

//  Created by Ушакова Антонина Андреевна on 12.10.2024.
//

import Foundation

struct Registration: Codable {
    var id: UUID
    var name: String
    var PhoneNumber: String
    var MailAddress: String
    var Pass: String        //переменная для пароля
    var ConfPass: String    //переменная для подтверждения пароля
    
}

//  Created by User on 12.10.2024.
//

import Foundation

