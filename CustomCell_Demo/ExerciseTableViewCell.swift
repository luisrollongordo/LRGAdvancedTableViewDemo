//
//  ExerciseTableViewCell.swift
//  CustomCell_Demo
//
//  Created by Luis Rollon Gordo on 1/11/16.
//  Copyright © 2016 EfectoApple. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
