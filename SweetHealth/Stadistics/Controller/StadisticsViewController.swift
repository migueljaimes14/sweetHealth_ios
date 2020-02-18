//
//  StadisticsViewController.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 18/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

class StadisticsViewController: UIViewController {
    
    
    @IBOutlet weak var imageApp: UIImageView!
    @IBOutlet weak var nameApp: UILabel!
    @IBOutlet weak var titlePercentage: UILabel!
    @IBOutlet weak var boxPercentage: UIView!
    @IBOutlet weak var numberPercentage: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    
    
    @IBAction func btnActionSave(_ sender: Any) {
    }
    
    @IBOutlet weak var viewGraf: UIView!
    @IBOutlet weak var viewTimer: UIView!
    
    var app:AppElement? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    func setUpView(){
        
    }
}
