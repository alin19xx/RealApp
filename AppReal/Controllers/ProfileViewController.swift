//
//  ProfileViewController.swift
//  AppReal
//
//  Created by Alex Lin on 17/02/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import UIKit
 
class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var tools: Tools = Tools()
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var imageProfile: UIButton!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return likedWatches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celdaCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "celdaCollection", for: indexPath) as! CollectionViewCellCustom
        tools.getImage(imagenURL: likedWatches[indexPath.row].img){ (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                celdaCollection.imgCollection.image = imagen
                    return
                }
            }
        }
        tools.getImage(imagenURL: likedWatches[indexPath.row].logo){ (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                    celdaCollection.brandImgCollection.image = imagen
                    return
                }
            }
        }
        return celdaCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "watchInfoProfile") as! ViewControllerWatchProfile
        vc.nameCollection = likedWatches[indexPath.row].name
        vc.brandCollection = likedWatches[indexPath.row].brand
        vc.descCollection = likedWatches[indexPath.row].desc
        vc.priceCollection = likedWatches[indexPath.row].price
        
        tools.getImage(imagenURL: likedWatches[indexPath.row].img) { (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                vc.imageWatch.image = imagen
                    return
                }
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBOutlet weak var profieImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tools.parseCSVWatches(watches: &likedWatches)
        print("\(likedWatches.count)")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        profieImg.layer.borderWidth = 1
        profieImg.layer.masksToBounds = false
        profieImg.layer.borderColor = UIColor.black.cgColor
        profieImg.layer.cornerRadius = profieImg.frame.height/2
        profieImg.clipsToBounds = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

}
