//
//  ViewController.swift
//  gerador senha
//
//  Created by Cristovão Lima on 21/07/22.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumbers: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swCapitalLatters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCaracters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        if let numberPasswords = Int(tfTotalPasswords.text!) {
            passwordsViewController.numberPasswords = numberPasswords
        }
        
        if let numberCaracters = Int(tfNumbers.text!) {
            passwordsViewController.numberCaracters = numberCaracters
        }
        passwordsViewController.useLatters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLatters = swCapitalLatters.isOn
        passwordsViewController.useSpecialChacaracters = swSpecialCaracters.isOn
        view.endEditing(true)
    }


}

