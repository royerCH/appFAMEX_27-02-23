//
//  Menu2ViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 10/10/22.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var viewTicket: UIView!
    
    @IBOutlet weak var btnEditProfile: UIButton!
    
    @IBOutlet weak var imgBGMenu: UIImageView!
    @IBOutlet weak var imgTicket: UIImageView!
    @IBOutlet weak var imgProfile: UIImageView!
    
    
    @IBOutlet weak var tableViewMenu: UITableView!
    
    @IBOutlet weak var lblPilot: UILabel!
    @IBOutlet weak var lblNamePilot: UILabel!
    
    
    

    //MARK: - Properties
    //static let userName = MenuViewController ()
    var userNameMenu: String?
    
    struct structMenu {             // Campos de la opcion del menu
        var camptitle = String()    // titulo de cada pantalla
        var campsegue = String()    // Nombre de cada Segue
        var campimage = String()    // Nombre de cada imagen
    }
    
    // Arreglo con las pciones del menu
    var optionsMenu: [structMenu] = [
        
        structMenu(camptitle: "Inicio",         // Nombre de la opcion
                   campsegue: "InicioSegue",    // Nombre del segue
                   campimage: "imgIconInicio"), // Nombre del icono de la opion
        structMenu(camptitle: "FAMEX",
                   campsegue: "FAMEXSegue",
                   campimage: "imgIconFAMEX"),
        structMenu(camptitle: "FRANCIA",
                   campsegue: "FRANCIASegue",
                   campimage: "imgIconFRANCIA"),
        structMenu(camptitle: "Evento",
                   campsegue: "EventoSegue",
                   campimage: "imgIconEvento"),
        structMenu(camptitle: "Mi Itinerario",
                   campsegue: "ItinerarioSegue",
                   campimage: "imgIconItinerario"),
        structMenu(camptitle: "Restaurantes",
                   campsegue: "RestaurantesSegue",
                   campimage: "imgIconRestaurantes"),
        structMenu(camptitle: "Espectaculo Aereo",
                   campsegue: "EspectAerSegue",
                   campimage: "imgIconEspectAer"),
        structMenu(camptitle: "FAMEX EN MUMA",
                   campsegue: "MUMASegue",
                   campimage: "imgIconMUMA"),
        structMenu(camptitle: "Accesos P.C.D",
                   campsegue: "AccesSegue",
                   campimage: "imgIconAcces"),
        structMenu(camptitle: "Sanitizaciòn",
                   campsegue: "SanitizacionSegue",
                   campimage: "imgIconSanitizacion"),
        structMenu(camptitle: "PRE-FAMEX",
                   campsegue: "PreparateSegue",
                   campimage: "imgIconPreparate"),
        structMenu(camptitle: "Configuración",
                   campsegue: "ConfigSegue",
                   campimage: "imgIconConfig"),
        structMenu(camptitle: "Cerrar Sesión",
                   campsegue: "logInSegue",
                   campimage: "imgCerrarSesion")//pendiente con esta imágen
        
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewMenu.dataSource = self     // Se delega en la misma vista
        tableViewMenu.delegate = self
        tableViewMenu.register(UINib(nibName: "TableViewCellMenu", bundle: nil), forCellReuseIdentifier: "cellOptionMenu")
        
        // methods calling
        customView()
    

    }
    
    func customView() {
        
        tableViewMenu.backgroundColor = .clear
        viewTicket.backgroundColor = .clear

        
        imgProfile.round()
        
        lblPilot.text = "Piloto:"
        lblPilot.font = UIFont(name: "Arial", size: 15)
        lblPilot.textColor = .white
        
        lblNamePilot.text = "Usuario"

        lblNamePilot.font = UIFont(name: "Arial", size: 20)
        lblNamePilot.textColor = .white
        lblNamePilot.numberOfLines = 0
        lblNamePilot.adjustsFontSizeToFitWidth = true
        lblNamePilot.minimumScaleFactor = 0.5
        
        btnEditProfile.setTitle("Perfil", for: .normal)
        btnEditProfile.titleLabel?.textAlignment = .left
        btnEditProfile.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btnEditProfile.titleLabel?.textColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        btnEditProfile.titleLabel?.adjustsFontSizeToFitWidth = true
        
    }
    

    

}

// MARK: - UITableViewDataSource
// Protocolo del table view
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Metodo que retorna el numero total de filas(Numero de pciones del menu)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsMenu.count    // Numero de opciones del menu
    }
    /*
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOptionMenu", for: indexPath) as? TableViewCellMenu
        
        cell?.lblOptionMenu.text = optionsMenu[indexPath.row].camptitle
        cell?.imgIconMenu.image = UIImage(named: optionsMenu[indexPath.row].campimage)
        
        return cell!
        
    }*/
    
    // Metodo que retorna todas las celdas. *Llena el table view (Opciones del menu)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOptionMenu", for: indexPath) as! TableViewCellMenu
        
        cell.lblOptionMenu.text = optionsMenu[indexPath.row].camptitle  // Colocar el titulo a cada celda
        cell.imgIconMenu.image = UIImage(named: optionsMenu[indexPath.row].campimage) // Colocar la imagen a cada celda
        
        // Color de Fondo celda seleccionada
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        cell.selectedBackgroundView = bgColorView
        
        cell.lblOptionMenu.font = UIFont(name: "Impact", size: 15)
        cell.lblOptionMenu.adjustsFontSizeToFitWidth = true
        cell.lblOptionMenu.minimumScaleFactor = 0.5
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(indexPath)
        
        
        // Segues de cada opcion del Menu
        switch indexPath {
        
            case [0, 0]:
                performSegue(withIdentifier: "1", sender: self)
                
            case [0, 1]:
                performSegue(withIdentifier: "2", sender: self)
                
            case [0, 2]:
                performSegue(withIdentifier: "3", sender: self)
                
            case [0, 3]:
                performSegue(withIdentifier: "4", sender: self)
                
            case [0, 4]:
                performSegue(withIdentifier: "5", sender: self)
                
            case [0, 5]:
                performSegue(withIdentifier: "6", sender: self)
                
            case [0, 6]:
                performSegue(withIdentifier: "7", sender: self)
                
            case [0, 7]:
                performSegue(withIdentifier: "8", sender: self)
            
            case [0, 8]:
                performSegue(withIdentifier: "9", sender: self)
            
            case [0, 9]:
                performSegue(withIdentifier: "10", sender: self)
                
            case [0, 10]:
                performSegue(withIdentifier: "11", sender: self)
                
            case [0, 11]:
                performSegue(withIdentifier: "12", sender: self)
        case [0, 12]:
            performSegue(withIdentifier: "13", sender: self)
                
            default:
                print("Nada")
        }
    }
    
    
    
}
