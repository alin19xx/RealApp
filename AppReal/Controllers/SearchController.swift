//
//  SearchController.swift
//  AppReal
//
//  Created by Alex Lin on 25/02/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import UIKit
public var likedWatches:[Watch] = [Watch]()

class SearchController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{

    var watches:[Watch] = [Watch]()
    var tools: Tools = Tools()
    //Variables
    @IBOutlet weak var tableViewSearch: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //Array de los relojes filtrados
    public var filterWatches:[Watch] = [Watch]()
        var isSearching: Bool = false
    
    //Ternaria para indicar si se esta buscando o no
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return !isSearching ? watches.count : filterWatches.count
    }
    
    //Cargamos los datos en cada celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdaSearch = tableView.dequeueReusableCell(withIdentifier: "celdaSearch", for: indexPath) as! TableViewCellSearch
        
        if isSearching {
            //Si se esta buscando cargamos la lista de relojes filtrados
            celdaSearch.nameSearch.text = filterWatches[indexPath.row].name
            celdaSearch.brandSearch.text = filterWatches[indexPath.row].brand
            celdaSearch.isLiked.image = filterWatches[indexPath.row].isLiked ? UIImage(named: "Liked") : UIImage(named: "Unliked")
            tools.getImage(imagenURL: watches[indexPath.row].img){ (imgRecovered) -> Void in
                if let imagen = imgRecovered {
                    DispatchQueue.main.async {
                        celdaSearch.imgSearch.image = imagen
                        return
                    }
                }
            }
            tools.getImage(imagenURL: watches[indexPath.row].logo){ (imgRecovered) -> Void in
                if let imagen = imgRecovered {
                    DispatchQueue.main.async {
                        celdaSearch.imgBrandSearch.image = imagen
                        return
                    }
                }
            }
        }else{
            //Si no se esta buscando cargamos el array de relojes normales
            celdaSearch.nameSearch.text = watches[indexPath.row].name
            celdaSearch.brandSearch.text = watches[indexPath.row].brand
            celdaSearch.isLiked.image = watches[indexPath.row].isLiked ? UIImage(named: "Liked") : UIImage(named: "Unliked")
            tools.getImage(imagenURL: watches[indexPath.row].img){ (imgRecovered) -> Void in
                if let imagen = imgRecovered {
                    DispatchQueue.main.async {
                        celdaSearch.imgSearch.image = imagen
                        return
                    }
                }
            }
            tools.getImage(imagenURL: watches[indexPath.row].logo){ (imgRecovered) -> Void in
                if let imagen = imgRecovered {
                    DispatchQueue.main.async {
                        celdaSearch.imgBrandSearch.image = imagen
                        return
                    }
                }
            }
        }
        //celdaSearch.isLiked.addTarget(self, action: #selector(giveLike), for: .touchUpInside)
        return celdaSearch
    }
    
    //Esta funcion se utilizaria dependiendo de si se pone un boton en la row o no. Con esto se utiliza el .tag
    @objc func giveLike(sender: UIButton){
        
    }
    
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
            if(self.watches[indexPath.row].isLiked){
                likedWatches.append(self.watches[indexPath.row])
                print("Añadido reloj \(indexPath.row)")
            } else {
                likedWatches.remove(at:  likedWatches.firstIndex(of: self.watches[indexPath.row])!)
            }
            
            //Recargamos la row modificada
            self.tableViewSearch.reloadRows(at: [indexPath], with: .none)
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
    
    //Funcion para hacer la animacion del tableview
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75){
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Le decimos al view controller que controle el tableview
        tableViewSearch.delegate = self
        tableViewSearch.dataSource = self
        searchBar.delegate = self
        tools.parseCSVWatches(watches: &watches)
        print("\(likedWatches.count)")
    }
    
    //Altura de la row de la tableview
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        /* FILTRADO SOLO POR EL PRINCIPIO DEL TÍTULO
         filterMovies = listMovies.filter({$0.title.prefix(searchText.count) == searchText})
         */
        
        //FILTRADO POR CUALQUIER CONTENIDO DEL TÍTULO
        //filterWatches = watches.filter({$0.name.lowercased().contains(searchText.lowercased())})
        
        //Filtrar a traves del tableview
        filterWatches = watches.filter({ (watch) -> Bool in
            return watch.name.lowercased().contains(searchText.lowercased())
        })
        isSearching = searchText != "" ? true : false
        tableViewSearch.reloadData()
    }

  

}
