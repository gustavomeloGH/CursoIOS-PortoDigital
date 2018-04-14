//
//  ViewController.swift
//  GugaMeloApp
//
//  Created by Lab on 24/03/2018.
//  Copyright © 2018 Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var labelAsk: UILabel!
    @IBOutlet weak var textFieldSenha: UITextField!
    @IBOutlet weak var labelErrorMsg: UILabel!
    @IBOutlet weak var passwordOutput: UILabel!
    
    let emptyError: String = "O campo está vazio"
    let passwordError: String = "A senha não está coreta"
    
    var passwordArray: [String] = ["casa", "carro", "camarao", "comando", "colchao"]
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func send(_ sender: Any) {
        if let isEmpty = textFieldSenha.text?.isEmpty {
            if(!isEmpty) {
                let textField = textFieldSenha.text!
                if (isCorrectPassword(text: textField)) {
                    refreshCorrectPassword()
                } else {
                    labelErrorMsg.text = passwordError
                }
            } else {
                labelErrorMsg.text = emptyError
            }
        }
    }
    
    func isCorrectPassword(text: String) -> Bool {
        return passwordArray[count].lowercased() == text.lowercased();
    }
    
    
    func addPasswordOutput() {
        if(count==0) {
            passwordOutput.text = passwordArray[count]
        } else {
            passwordOutput.text = passwordOutput.text! + ", " + passwordArray[count]
        }
    }
    
    func refreshCorrectPassword() {
        addPasswordOutput()
        labelErrorMsg.text = ""
        count += 1
    }
    
}

