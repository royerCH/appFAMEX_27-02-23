//
//  BienvenidaViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 13/02/23.

// creando pruebas para subir a git hub 
//

import UIKit

class BienvenidaViewController: UIViewController {

    
    @IBOutlet weak var verIdioma: UILabel!
    @IBOutlet weak var BgWelcome: UIImageView!
    var tipoIdioma: Int?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if tipoIdioma == 0 {
            BgWelcome.image = UIImage(named: "0Inicio1")
          
            verIdioma.text = ("Idioma  \(String(describing: tipoIdioma))")
            
        }else{
            BgWelcome.image = UIImage(named: "0Inicio2")
            verIdioma.text = ("Idioma  \(String(describing: tipoIdioma))")
        }
  
    }
    
    
    
       
   
    
}
