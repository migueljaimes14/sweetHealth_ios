//
//  HomeTableViewCell.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 11/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var imageApp: UIImageView!
    @IBOutlet weak var nameApp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageApp.roundImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
