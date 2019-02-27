//
//  ViewController.swift
//  AppReal
//
//  Created by Alex Lin on 16/02/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    var watches:[Watch] = [Watch]()
    var tools: Tools = Tools()
    var imgWatches:[UIImage] = [UIImage]()
    
    /*TableView funcs*/
        //Number of items of watches
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watches.count
    }
        //Info of each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! TableViewCellCustom
        //Function to convert a HTTPS url to an ImageView (watch image)
    tools.getImage(imagenURL: watches[indexPath.row].img) { (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                    celda.imgCell.image = imagen
                    return
                }
            }
        }
        //Function to convert
        tools.getImage(imagenURL: watches[indexPath.row].logo) { (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                    celda.logoCell.image = imagen
                    return
                }
            }
        }
        //celda.imgCell
        celda.nameCell.text = watches[indexPath.row].name
        celda.brandCell.text = watches[indexPath.row].brand
        celda.genderCell.text = watches[indexPath.row].gender
        celda.priceCell.text = "\(watches[indexPath.row].price) $"
        celda.isLiked.image = watches[indexPath.row].isLiked ? UIImage(named: "Liked") : UIImage(named: "Unliked")
        
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "watchInfo") as! ViewControllerWatch

        vc.nameTable = watches[indexPath.row].name
        vc.brandTable = watches[indexPath.row].brand
        vc.descTable = watches[indexPath.row].desc
        vc.priceTable = watches[indexPath.row].price
        
        tools.getImage(imagenURL: watches[indexPath.row].img) { (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                    vc.imgView.image = imagen
                    return
                }
            }
        }

        //Code to represent de view controller
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    //Function to configure the context of the gestures about the custom table view cell
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let isLiked = likedCategory(indexPath:indexPath)
       // let addToCart added
        //Devolvemos un array de las diferentes configuraciones que va a tener el swipe
        return UISwipeActionsConfiguration(actions: [isLiked])
    }
    
    //Funcion para configurar todo el tema del swipe
    func likedCategory(indexPath:IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .normal, title: "Like"){ (action,view,completion) in
            //Negamos el estado de liked o unliked para poder hacer la accion contraria
            self.watches[indexPath.row].isLiked = !self.watches[indexPath.row].isLiked
            
            //Recargamos la row modificada
            self.tableView.reloadRows(at: [indexPath], with: .none)
            completion(true)
        }
        //El action title es el texto que va a salir cuando se deslize a  la izquierda
            action.title = self.watches[indexPath.row].isLiked ? "Dislike" : "Like"
        action.image = UIImage(named: "Heart")
        //Esto es el fondo de lo que te saca al desplazar para la izquierda
        action.backgroundColor = self.watches[indexPath.row].isLiked  ? UIColor.lightGray : UIColor.init(red:1.00, green:0.47, blue:0.47, alpha:1.0)
        //Despues de modificar la informacion de la row recargamos la nueva informacion en el table view
            //self.tableView.reloadData()
            return action
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75){
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    
    
    
    //Console print array watches
    func printWatches(){
        for watch in watches{
            print(watch)
        }
    }
    
    func printUrls(){
        for img in imgWatches{
            print(img)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /*TableView*/
        tableView.delegate = self
        tableView.dataSource = self
        /*Tools*/
        tools.parseCSVWatches(watches: &watches)
        //printWatches()
        imgWatches = tools.downloadImages()
        
        printUrls()
    }
}

