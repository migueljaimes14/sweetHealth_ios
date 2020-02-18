//
//  UIImageView.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 11/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

extension UIImageView {
    func roundImage(){
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
        self.layer.borderColor = MyColors.pinkApp.cgColor
        self.layer.borderWidth = 4
    }
}
