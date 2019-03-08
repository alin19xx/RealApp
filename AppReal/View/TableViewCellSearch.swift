//
//  TableViewCellSearch.swift
//  AppReal
//
//  Created by Alex Lin on 25/02/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import UIKit

class TableViewCellSearch: UITableViewCell {
    
    
    @IBOutlet weak var imgSearch: UIImageView!
    @IBOutlet weak var nameSearch: UILabel!
    @IBOutlet weak var imgBrandSearch: UIImageView!
    @IBOutlet weak var brandSearch: UILabel!
    
    @IBOutlet weak var isLiked: UIImageView!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
