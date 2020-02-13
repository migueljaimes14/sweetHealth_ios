//
//  LoginViewController.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 14/01/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailImput: UITextField!
    @IBOutlet weak var paswordLabel: UILabel!
    @IBOutlet weak var passwordImput: UITextField!
    @IBAction func loginClicked(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        let apiManager = ApiManger()
        apiManager.getAllData()
    }
    
    func setupView(){
        logoImage?.image = #imageLiteral(resourceName: "imageCardBack")
        logoImage?.contentMode = .scaleAspectFill
        emailLabel?.text = Literals.titleEmail
        paswordLabel?.text = Literals.titlePassword
        self.delegate()
    }
    
    func delegate() {
        self.emailImput?.delegate = self
        self.passwordImput?.delegate = self
    }
}

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailImput.resignFirstResponder()
        passwordImput.resignFirstResponder()
        return true
    }
}
