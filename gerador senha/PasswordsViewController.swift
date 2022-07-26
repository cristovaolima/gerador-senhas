//
//  PasswordsViewController.swift
//  Gerador de Senha
//
//  Created by Cristovão Lima on 25/07/22.
//

import UIKit

class PasswordsViewController: UIViewController {
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberCaracters: Int = 10
    var numberPasswords: Int = 1
    var useLatters: Bool!
    var useNumbers: Bool!
    var useCapitalLatters: Bool!
    var useSpecialChacaracters: Bool!
    
    var passwordGeneretor: PasswordGeneretor!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordGeneretor = PasswordGeneretor(numberCaracters: numberCaracters, useLatters: useLatters, useNumbers: useNumbers, useCapitalLatters: useCapitalLatters, useSpecialChacaracters: useSpecialChacaracters)
        generatePasswords()
    }
    
    func generatePasswords() {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordGeneretor.generate(total: numberPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
}
