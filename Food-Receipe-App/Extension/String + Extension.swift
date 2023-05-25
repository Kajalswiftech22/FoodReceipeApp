//
//  String + Extension.swift
//  Food-Receipe-App
//
//  Created by Kajol   on 24/05/23.
//

import Foundation

extension String{
    
    func validateEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
    }
    
    func validateUsername() -> Bool{
        let usernameRegEx = "^\\w{7,18}$"
        return applyPredicateOnRegex(regexStr: usernameRegEx)
    }
    func validatePassword(mini: Int = 8, max: Int = 8) -> Bool{
        //Minimum 8 characters at least 1 Alphabet and 1 Number
        var passwordRegEx = ""
        if mini >= max{
            passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),}$"
        }
        else{
            passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),\(max)}$"

        }
        return applyPredicateOnRegex(regexStr: passwordRegEx)
    }
    
    func applyPredicateOnRegex(regexStr: String) -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
}
