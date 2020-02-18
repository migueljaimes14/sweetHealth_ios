//
//  DetailTableViewCell.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 17/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imageApp: UIImageView!
    @IBOutlet weak var nameApp: UILabel!
    @IBOutlet weak var dateApp: UILabel!
    @IBOutlet weak var timerApp: UILabel!
    @IBOutlet weak var timeApp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timerApp.text = Literals.titleTimer
        imageApp.roundImage()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
