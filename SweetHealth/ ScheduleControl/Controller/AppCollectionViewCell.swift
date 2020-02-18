//
//  AppCollectionViewCell.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 18/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

class AppCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageApp: UIImageView!
    @IBOutlet weak var nameApp: UILabel!
    
    @IBOutlet weak var opacity: UIImageView!
    override func awakeFromNib() {
         imageApp.roundImage()
        opacity.roundImage()
        opacity.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        opacity.alpha = 0.5
        self.imageApp.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
            self.imageApp.alpha = 1
        }, completion: nil)
    }
}
