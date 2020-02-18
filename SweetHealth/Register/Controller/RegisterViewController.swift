//
//  RegisterViewController.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 10/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    
    
    @IBOutlet weak var registerUserName: UILabel!
    @IBOutlet weak var registerUserLastName: UILabel!
    @IBOutlet weak var registerUserEmail: UILabel!
    @IBOutlet weak var registerUserPassword: UILabel!
    @IBOutlet weak var registerUserRepeatPassword: UILabel!
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var textNameUser: UITextField!
    @IBOutlet weak var textLastNameUser: UITextField!
    @IBOutlet weak var textUserEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textRepeatPassword: UITextField!
    
    @IBAction func registerClicked(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView(){
        logoImage?.image = #imageLiteral(resourceName: "imageCardBack")
        logoImage?.contentMode = .scaleAspectFill
        registerUserName.text = Literals.registerNameUser
        registerUserLastName.text = Literals.registerLastName
        registerUserEmail.text = Literals.registerEmail
        registerUserPassword.text = Literals.registerPassword
        registerUserRepeatPassword.text = Literals.registerRepeatPassword
    }

}
