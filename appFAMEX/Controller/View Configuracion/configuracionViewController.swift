//
//  configuracionViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 08/09/22.
//

import UIKit

class configuracionViewController: UIViewController, protocoloMenu {
    
    
    @IBOutlet weak var viewConfiguracion: UIView!
    //Cajas
    @IBOutlet weak var viewIdiNoti: UIView!
    @IBOutlet weak var viewPreRepCon: UIView!
    @IBOutlet weak var viewSobTer: UIView!
    
    //Buttons
    @IBOutlet weak var btnIdioma: UIButton!
    @IBOutlet weak var btnNotificaciones: UIButton!
    //parte 2 btns
    @IBOutlet weak var btnPreguntasFrecuentes: UIButton!
    @IBOutlet weak var btnReportarUnProblema: UIButton!
    @IBOutlet weak var btnContacto: UIButton!
    //parte 3 btns
    @IBOutlet weak var btnSobreLaAplicacion: UIButton!
    @IBOutlet weak var btnTerminosYCondiciones: UIButton!
    
    
    
    // Labels
    @IBOutlet weak var lblConfiguracion: UILabel!
    
    var menu: Bool = false  // Bandera menu
    
    var viewOptionSelect: CGAffineTransform = CGAffineTransform()   // Animacion del menu


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.0307629546, green: 0.1608202691, blue: 0.325432595, alpha: 1)

        viewOptionSelect = viewConfiguracion.transform  // Animacion del menu
        customNavigationBar()                           // Poner navigation Bar
        addchildController()                            // Poner Menu
        
    customLabelsAndButtons()
    EstilosCajas()
    }

    //----------Methods--------------------
    private func addchildController() {
        
        let menuViewController = storyboard!.instantiateViewController(withIdentifier: "Menu")
        self.addChild(menuViewController)
        menuViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuViewController.view)
        NSLayoutConstraint.activate([
                                        menuViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),   // Constraint Izquierdo
                                        menuViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),   // Constraint derecho
                                        menuViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),          // Constraint superior
                                        menuViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)])    // Constraint inferior
        menuViewController.didMove(toParent: self)
        self.view.sendSubviewToBack(menuViewController.view)
        
    }
    //metodo para personalizar el Navigation bar
    func customNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "CONFIGURACION"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "imgBtnHamburguesa")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(btnMenuHamburguesa))
    }
    
    //Metodo para personalizar los botones y labels
    func customLabelsAndButtons () {
        //LABELS
        //Label Configuracion
        lblConfiguracion.text = "  CONFIGURACIONES"  //Hola, desconozco el error que sale ayuda
        lblConfiguracion.font = UIFont(name: "Arial", size: 25)
        lblConfiguracion.textColor = .white
        lblConfiguracion.textAlignment = .center
                
              
       // BOTONES
       // Boton idioma
       btnIdioma.backgroundColor = .clear
       btnIdioma.setTitleColor(.white, for: .normal)
        
       // Boton Notificaciones
       btnNotificaciones.backgroundColor = .clear
       btnNotificaciones.setTitleColor(.white, for: .normal)

       // Boton preguntas frecuentes
       btnPreguntasFrecuentes.backgroundColor = .clear
       btnPreguntasFrecuentes.setTitleColor(.white, for: .normal)
        
        btnPreguntasFrecuentes.setTitle(" Preguntas\nFrecuentes", for: .normal)
        btnPreguntasFrecuentes.titleLabel?.numberOfLines = 0
        
       // Boton Reportar un problema
       btnReportarUnProblema.backgroundColor = .clear
       btnReportarUnProblema.setTitleColor(.white, for: .normal)
        btnReportarUnProblema.setTitle("Reportar un\n  Problema", for: .normal)
        btnReportarUnProblema.titleLabel?.numberOfLines = 0
        
       // Boton Contacto
       btnContacto.backgroundColor = .clear
       btnContacto.setTitleColor(.white, for: .normal)
        
       // Boton Sobre la Aplicacion
       btnSobreLaAplicacion.backgroundColor = .clear
       btnSobreLaAplicacion.setTitleColor(.white, for: .normal)
        btnSobreLaAplicacion.setTitle(" Sobre la\nAplicación", for: .normal)
        btnSobreLaAplicacion.titleLabel?.numberOfLines = 0
        
       // Boton Terminos y Condiciones
       btnTerminosYCondiciones.backgroundColor = .clear
       btnTerminosYCondiciones.setTitleColor(.white, for: .normal)
        btnTerminosYCondiciones.setTitle(" Términos y \nCondiciones", for: .normal)
        btnTerminosYCondiciones.titleLabel?.numberOfLines = 0
        
    }
    
    func EstilosCajas () {
        viewIdiNoti.layer.cornerRadius = 10
        viewPreRepCon.layer.cornerRadius = 10
        viewSobTer.layer.cornerRadius = 10
    }

    //Actions
    
    @objc func btnMenuHamburguesa() {
        if menu == false {
            viewConfiguracion.showMenu()
            menu = true
        }else if menu == true {
            viewConfiguracion.hideMenu(viewOptionSelect: viewOptionSelect)
            menu = false
        }    }
    
    
    // Accion para el boton Idioma *a`n sin/funcionamiento
   @IBAction func btnActionIdioma(_ sender: Any)
    {
    
       
    
   }
    // Accion para el boton Notificaciones *s/f
   @IBAction func btnActionNotificaciones(_ sender: Any)
    { }
    // Accion para el boton Preguntas Frecuentes *s/f
   @IBAction func btnActionPreguntasFrecuentes(_ sender: Any)
    { }
    // Accion para el boton Reportar n Problema *s/f
   @IBAction func btnActionReportarUnProblema(_ sender: Any)
    { }
    // Accion para el boton Contacto *s/f
   @IBAction func btnActionContacto(_ sender: Any)
    { }
    // Accion para el boton Sobre La Aplicacion *s/f
   @IBAction func btnActionSobreLaAplicacion(_ sender: Any)
    { }
    // Accion para el boton Terminos Y Condiciones *s/f
   @IBAction func btnActionTerminosYCondiciones(_ sender: Any)
    { }
    
    
    
}


 
 
