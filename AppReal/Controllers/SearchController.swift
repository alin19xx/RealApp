//
//  SearchController.swift
//  AppReal
//
//  Created by Alex Lin on 25/02/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import UIKit

class SearchController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    var watches:[Watch] = [Watch]()
    var tools: Tools = Tools()
    @IBOutlet weak var tableViewSearch: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var isSearching: Bool = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdaSearch = tableView.dequeueReusableCell(withIdentifier: "celdaSearch", for: indexPath) as! TableViewCellSearch
        
        celdaSearch.nameSearch.text = watches[indexPath.row].name
        celdaSearch.brandSearch.text = watches[indexPath.row].brand
        tools.getImage(imagenURL: watches[indexPath.row].img){ (imgRecovered) -> Void in
            if let imagen = imgRecovered {
                DispatchQueue.main.async {
                    celdaSearch.imgSearch.image = imagen
                    return
                }
            }
        }
        
        return celdaSearch
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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSearch.delegate = self
        tableViewSearch.dataSource = self
        tools.parseCSVWatches(watches: &watches)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
