//
//  CustomTabBarController.swift
//  AppReal
//
//  Created by Alex Lin on 16/02/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*TabBarAppearance*/
    UITabBarItem.appearance()
        .setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
    UITabBarItem.appearance()
        .setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        
        /*TabBar item 1*/
    tabBarItem = self.tabBar.items![0]
    tabBarItem.image = UIImage(named: "UnselectedHome")?.withRenderingMode(.alwaysOriginal)
    tabBarItem.selectedImage = UIImage(named: "SelectedHome")?.withRenderingMode(.alwaysOriginal)
        
        /*TabBar item 2*/
    tabBarItem = self.tabBar.items![1]
    tabBarItem.image = UIImage(named: "UnselectedSearch")?.withRenderingMode(.alwaysOriginal)
    tabBarItem.selectedImage = UIImage(named: "SelectedSearch")?.withRenderingMode(.alwaysOriginal)
    
        /*TabBar item 3*/
    tabBarItem = self.tabBar.items![2]
    tabBarItem.image = UIImage(named: "UnselectedMenu")?.withRenderingMode(.alwaysOriginal)
    tabBarItem.selectedImage = UIImage(named: "SelectedMenu")?.withRenderingMode(.alwaysOriginal)
        
        /*TabBar item 4*/
    tabBarItem = self.tabBar.items![3]
    tabBarItem.image = UIImage(named: "UnselectedCarrito")?.withRenderingMode(.alwaysOriginal)
    tabBarItem.selectedImage = UIImage(named: "SelectedCarrito")?.withRenderingMode(.alwaysOriginal)
        
        /*TabBar item 5*/
    tabBarItem = self.tabBar.items![4]
    tabBarItem.image = UIImage(named: "UnselectedProfile")?.withRenderingMode(.alwaysOriginal)
    tabBarItem.selectedImage = UIImage(named: "SelectedProfile")?.withRenderingMode(.alwaysOriginal)
    }
    

}
