//
//  Tools.swift
//  AppReal
//
//  Created by Alex Lin on 17/02/2019.
//  Copyright © 2019 Alex Lin. All rights reserved.
//

import Foundation
import UIKit

class Tools {
    
    var urlImages: [String] = []
    var imageArray:[UIImage] = [UIImage()]
    func parseCSVWatches(watches: inout [Watch]) {
    let path = Bundle.main.path(forResource: "CSVWatches_v2", ofType: "csv")!
    
        do{
    
            //Using the csv library
            let csv = try CSV(contentsOfURL: path)
    
            //Iterating the file row by row and saving into an array
            for row in csv.rows {
                watches.append(Watch(id: row["id"]!, img: row["img"]! != "" ? row["img"]! : "null", name: row["name"]!, desc: row["desc"]!, brand: row["brand"]!, gender: row["gender"]!, price: row["price"]!, logo: row["logo"]! != "" ? row["logo"]! : "null"))
                //Guardamos las urls de las imagenes en un array de strings para luego descargar las imagenes y no tener que hacer mas peticiones
                if (row["img"] != ""){
                    urlImages.append(row["img"]!)
                }
                //urlImages.append((img: row["img"]! != "" ? row["img"]! : "null") as! String)
            }
    
        } catch let error as NSError {
            print("CSV decodefier error", error)
        }
    }
    
    func getImage(imagenURL:String, completion: @escaping (_ image: UIImage?) -> ()) {
        
        let imgURL = URL(string: imagenURL)!
        //var imagen:UIImage = UIImage()
        
        //Creates a default configuration object that uses the disk-persisted global cache, credential and cookie storage objects.
        //Creamos la sesion
        let session = URLSession(configuration: .default)
        
        //Obtengo la URL definiendola del tipo data, el cod de respuesta y el error
        session.dataTask(with: imgURL) { (data, response, error) in
            //Una vez descargada la imagen puedo tratarla
            //Comprobamos que no se haya producido ningun error
            if let e = error {
                print("Error downloading image: \(e)")
            } else {
                // Tratamos la respuesta de la URL
                //Comprobamos el tipo de respuesta obtenida
                if let res = response as? HTTPURLResponse {
                    print("Downloaded image with response code \(res.statusCode)") //200 todo OK
                    //Tratamos el data obtenido de la URL
                    if let imageData = data {
                        // Convertimos la imagen del tipo data a una UIImage para poder enviarla en el completion
                        completion(UIImage(data: imageData)!)
                    } else {
                        print("Couldn't get image: Image is nil") //No se ha podido obtener el recurso
                    }
                } else {
                    print("Couldn't get response code for some reason") //El servidor no esta accesible
                }
            }
            }.resume()
    }
    
    func downloadImages() -> Array<UIImage>{
        for img in urlImages{
            getImage(imagenURL:img) { (imgRecovered) -> Void in
                if let imagen = imgRecovered {
                    DispatchQueue.main.async {
                        self.imageArray.append(imagen)
                    }
            }
        }
    }
    return self.imageArray
}
}
