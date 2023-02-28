//
//  BienvenidaViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 13/02/23.

// creando pruebas para subir a git hub 
//

import UIKit

class BienvenidaViewController: UIViewController {

   
    
    
    @IBOutlet var viewBienvenida: UIView!
    
    @IBOutlet weak var bGround: UIImageView!
    
    @IBOutlet weak var btnIrInicio: UIButton!
    
    @IBOutlet weak var saludo: UILabel!
    
    @IBOutlet weak var textoUno: UILabel!
    
    @IBOutlet weak var textoDos: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Bienvenida"
      
        btnIrInicio.round()
        btnIrInicio.setTitle("Iniciar", for: .normal)     // Titulo del boton
        btnIrInicio.titleLabel?.font = UIFont(name: "Plateia", size: 15)
        btnIrInicio.titleLabel?.adjustsFontSizeToFitWidth = true
        btnIrInicio.titleLabel?.minimumScaleFactor = 0.5
        btnIrInicio.setTitleColor(.white, for: .normal)          // Color de letras
        btnIrInicio.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)  // Color
    
        saludo.text = NSLocalizedString("saludo", comment: "")
        textoUno.text = NSLocalizedString("textoUno", comment: "")
        textoDos.text = NSLocalizedString("textoDos", comment: "")
        
    }
    
    
    
    @IBAction func btnIrInicioAction(_ sender: Any) {
        
        performSegue(withIdentifier: "inicio", sender: self)
        
        
        let myArray = ["hola","Mundo","Nuevo"]
        print(myArray)
    }
    
   
    
}
