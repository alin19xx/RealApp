//
//  ViewControllerWatchProfile.swift
//  AppReal
//
//  Created by Alex Lin on 06/03/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import UIKit

class ViewControllerWatchProfile: UIViewController {

    //Variables propias de la vista
    @IBOutlet weak var nameWatch: UILabel!
    @IBOutlet weak var brandWatch: UILabel!
    @IBOutlet weak var priceWatch: UILabel!
    @IBOutlet weak var descriptionWatch: UILabel!
    @IBOutlet weak var imageWatch: UIImageView!
    
    //Variables que estan relacionadas con la collection donde le pasamos el valor a cada una
    var nameCollection:String = ""
    var imgCollection:UIImage = UIImage()
    var brandCollection:String = ""
    var descCollection:String = ""
    var priceCollection:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Pasamos las variables de la otra vista y las igualamos en la vista actual
        nameWatch.text = nameCollection
        imageWatch.image = imgCollection
        brandWatch.text = brandCollection
        descriptionWatch.text = descCollection
        priceWatch.text = priceCollection
    }
    

   

}
