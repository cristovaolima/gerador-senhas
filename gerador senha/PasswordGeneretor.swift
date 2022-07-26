//
//  PasswordGeneretor.swift
//  Gerador de Senha
//
//  Created by Cristovão Lima on 25/07/22.
//

import Foundation

class PasswordGeneretor {
    var numberCaracters: Int
    var useLatters: Bool
    var useNumbers: Bool
    var useCapitalLatters: Bool
    var useSpecialChacaracters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%^&*()_-+=~`]]}[{';?/<>,"
    private let numbers = "0123456789"
    
    init(numberCaracters: Int, useLatters: Bool, useNumbers: Bool, useCapitalLatters: Bool, useSpecialChacaracters: Bool){
        
        var num = min(numberCaracters, 16)
        num = max(num, 1)
        
        self.numberCaracters = num
        self.useLatters = useLatters
        self.useNumbers = useNumbers
        self.useCapitalLatters = useCapitalLatters
        self.useSpecialChacaracters = useSpecialChacaracters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLatters{
            universe += letters
        }
        
        if useNumbers{
            universe += numbers
        }
        
        if useSpecialChacaracters {
            universe += specialCharacters
        }
        
        if useCapitalLatters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberCaracters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
    
}
