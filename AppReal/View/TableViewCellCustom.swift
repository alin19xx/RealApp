//
//  TableViewCellCustom.swift
//  AppReal
//
//  Created by Alex Lin on 17/02/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import UIKit

class TableViewCellCustom: UITableViewCell {

    
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var brandCell: UILabel!
    @IBOutlet weak var genderCell: UILabel!
    @IBOutlet weak var priceCell: UILabel!
    @IBOutlet weak var logoCell: UIImageView!
    
    @IBOutlet weak var isLiked: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
