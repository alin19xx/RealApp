//
//  ViewControllerWatch.swift
//  AppReal
//
//  Created by Alex Lin on 22/02/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import UIKit

class ViewControllerWatch: UIViewController {

    
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var brandView: UILabel!
    @IBOutlet weak var descView: UILabel!
    @IBOutlet weak var priceView: UILabel!
    
    var tools: Tools = Tools()
    
    var nameTable:String = ""
    var imgTable:UIImage = UIImage()
    var brandTable:String = ""
    var descTable:String = ""
    var genderTable:String = ""
    var priceTable:String = ""

    var imgHTTPstring:String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameView.text = nameTable
        imgView.image = imgTable
        brandView.text = brandTable
        descView.text = descTable
        priceView.text = priceTable
        
        
    }

}
