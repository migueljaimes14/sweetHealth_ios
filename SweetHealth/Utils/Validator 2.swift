//
//  File.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 10/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//
import UIKit

class Vallidator {
    
    private var valueCamp = false
    
    func emptyField(Field field: String)->Bool{
        if field.isEmpty {
            valueCamp = true
        } else {
            valueCamp = false
        }
        return valueCamp
    }
    
    func emailEmpty(Email email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func passwordLenght(Password password:String) -> Bool {
        if password.count >= 8 {
            valueCamp = true
        }else{
            valueCamp = false
        }
        return valueCamp
    }
    
    func validationOfBothFields(Password1 password1:String,Password2 password2:String) -> Bool {
        if(password1 == password2) {
            valueCamp = true
        }else
        {
            valueCamp = false
        }
        return valueCamp
    }
}
