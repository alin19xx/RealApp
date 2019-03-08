//
//  Watch.swift
//  AppReal
//
//  Created by Alex Lin on 17/02/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import Foundation
import UIKit

public class Watch: CustomStringConvertible, Equatable{
    
    
    public static func == (lhs: Watch, rhs: Watch) -> Bool {
        return lhs.id == rhs.id
    }

    var id: String
    var img: String
    var name: String
    var desc: String
    var brand: String
    var gender: String
    var price: String
    var logo: String
    var isLiked: Bool = false
    
    
    init(id: String, img: String, name: String, desc: String, brand: String, gender: String, price: String, logo:String) {
        self.id = id
        self.img = img
        self.name = name
        self.desc = desc
        self.brand = brand
        self.gender = gender
        self.price = price
        self.logo = logo
    }
    
    public var description: String {
        return "id: \(id) - img: \(img) - name: \(name) - desc: \(desc) - brand: \(brand) - gender: \(gender) - price: \(price) - logo: \(logo)"
    }
    
    
}
