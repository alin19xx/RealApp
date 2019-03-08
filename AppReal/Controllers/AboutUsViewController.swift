//
//  AboutUsViewController.swift
//  AppReal
//
//  Created by Alex Lin on 06/03/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var aboutImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutImg.layer.borderWidth = 1
        aboutImg.layer.masksToBounds = false
        aboutImg.layer.borderColor = UIColor.black.cgColor
        aboutImg.layer.cornerRadius = 2
        aboutImg.clipsToBounds = true
        
    }

}
