//
//  LoginViewModel.swift
//  PokeDemo
//
//  Created by mohomed Ali on 24/04/2023.
//

import Foundation

class LoginViewModel{
    
    func doValidLogin(emailID: String?, passwordId: String?) -> Bool{
        var isValid = false
        
        guard let emailInput = emailID else {
            return isValid
        }
        
        guard let passwordInput = passwordId else {
            return isValid
        }
        
        let isValidPassword = passwordInput.count >= 6
        
        // abc@yxz
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        let isEmailValid = emailPredicate.evaluate(with: emailInput)
        
        isValid = isValidPassword && isEmailValid
        
        return isValid
    }
    
}
