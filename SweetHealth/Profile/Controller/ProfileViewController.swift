//
//  ProfileViewController.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 18/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var swictTwo: UISwitch!
    @IBOutlet weak var swicthOne: UISwitch!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var btnSaved: RoundButton!
    @IBAction func returnHome(_ sender: Any) {
        performSegue(withIdentifier: "returnHome", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelOne.text = "Permitir notificaciones"
        labelTwo.text = "Permitir envio de mensaje"
        profilePicture.image = UIImage(named: "profile")
        profilePicture.roundImage()
        btnSaved.backgroundColor = MyColors.pinkApp
        btnSaved.setTitle("Guardar cambios", for: .normal)
    }

}
