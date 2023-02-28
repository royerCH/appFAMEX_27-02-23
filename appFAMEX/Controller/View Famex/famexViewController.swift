//
//  famexViewController.swift
//  appFAMEX
//
//  Created by user223114 on 9/7/22.
//

import UIKit


class famexViewController: UIViewController, protocoloMenu, UITableViewDelegate {
    
    //-----------------------OUTLETS-----------------------
    
        // Views

    @IBOutlet var viewMenu: UIView!
    
    @IBOutlet weak var viewFamex: UIView!
    @IBOutlet weak var viewInfoFAMEX: UIView!
    @IBOutlet weak var viewImgFamexVertical: UIView!
    @IBOutlet weak var viewAboutFAMEX: UIView!
    @IBOutlet weak var viewQueFAMEX: UIView!
    @IBOutlet weak var viewHistoriaFAMEX: UIView!
    @IBOutlet weak var viewObjetivosFAMEX: UIView!
    @IBOutlet weak var viewPorQue: UIView!
    @IBOutlet weak var viewYearsFAMEX: UIView!
    @IBOutlet weak var viewEdiPasadas: UIView!
    
    
    
        // Stack View
    @IBOutlet weak var StackViewFAMEX: UIStackView!
    @IBOutlet weak var stackViewAboutFAMEX: UIStackView!
    
    
        // Images
    @IBOutlet weak var imgBGFAMEX: UIImageView!
    @IBOutlet weak var imgBGGreen: UIImageView!
    @IBOutlet weak var imgBGGrey: UIImageView!
    @IBOutlet weak var imgBGRed: UIImageView!
    @IBOutlet weak var imgPorQue: UIImageView!
    
    
        // Scroll View
    @IBOutlet weak var ScrollViewFAMEX: UIScrollView!
    @IBOutlet weak var ScrollAcercaFAMEX: UIScrollView!
    
        // Labels
    @IBOutlet weak var lblQueFAMEX: UILabel!
    @IBOutlet weak var lblQueContenidoFAMEX: UILabel!
    @IBOutlet weak var lblHistoriaFAMEX: UILabel!
    @IBOutlet weak var lblHistoriaContenidoFAMEX: UILabel!
    @IBOutlet weak var lblObjetivosFAMEX: UILabel!
    @IBOutlet weak var lblObjetivosContenidoFAMEX: UILabel!
    @IBOutlet weak var lblPorQue: UILabel!
    @IBOutlet weak var lblPorQueContenido: UILabel!
    @IBOutlet weak var lblEdiPasadas: UILabel!
    
    
        // Buttons
    @IBOutlet weak var btnEdiPasadas: UIButton!
    
    
    
        // View Container
    @IBOutlet weak var containerView: UIView!
    
    
        // Swipe Gesture View
    @IBOutlet weak var swipeGestureView: UISwipeGestureRecognizer!
 
    //-----------------------Properties-----------------------
    
        // Objeto de clase FAMEXText

    
    //Objeto Menu
    
    internal var menu:Bool = false   // Bandera menu en falso, es decir, no se depliega el menu
    var viewOptionSelect = CGAffineTransform()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.0307629546, green: 0.1608202691, blue: 0.325432595, alpha: 1)
            
        viewInfoFAMEX.backgroundColor = .clear
        
        viewOptionSelect = viewFamex.transform
        customViews()
        customNavigationBar()
        addchildController()
    }
    
    //-----------------------METHODS-----------------------
    
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
    
    func customViews() {
        
        // Viewa
        viewInfoFAMEX.backgroundColor = .clear
        viewImgFamexVertical.backgroundColor = .clear
        viewAboutFAMEX.backgroundColor = .clear
        viewQueFAMEX.backgroundColor = .clear
        viewHistoriaFAMEX.backgroundColor = .clear
        viewObjetivosFAMEX.backgroundColor = .clear
        viewPorQue.backgroundColor = .clear
        viewYearsFAMEX.backgroundColor = .clear
        viewEdiPasadas.backgroundColor = .clear
        
        // Labels
            // Que es?
        
        let myText = FAMEXText()
        myText.HandlingText(Label: lblQueFAMEX, Title: "¿QUÉ ES?", Font: "Plateia", Size: 30, TextColor: .white, LineBreak: false, TextAlignment: .center)
        
            // Contenido de que es?
        let myText2 = FAMEXText2(Label: lblQueContenidoFAMEX, Title: "La Feria Aeroespacial México (FAMEX), es un evento organizado por la Secretaria de la Defensa Nacional (SEDENA) a través de la Fuerza Aérea Mexicana que integra actividades del ámbito aeronáutico civil, comercial, militar y de defensa.", Font: "Futura", Size: 18, TextColor: .white, LineBreak: true, TextAlignment: .center)
        myText2.HandlingText2()
        
            // Historia
        let myText3 = FAMEXText3()
        myText3.Label = lblHistoriaFAMEX
        myText3.Title = "HISTORIA"
        myText3.LineBreak = false
        myText3.HandlingText3()
        
            // Contenido de Historia
        lblHistoriaContenidoFAMEX.text = "La primera edición fue en el año 2015, con la finalidad de impulsar a México en el desarrollo económico del sector aeronáutico nacional, el responsable de la planeación, organización y materialización del evento fue el Comité Organizador."
        lblHistoriaContenidoFAMEX.numberOfLines = 0
        lblHistoriaContenidoFAMEX.adjustsFontSizeToFitWidth = true
        lblHistoriaContenidoFAMEX.minimumScaleFactor = 0.5
        lblHistoriaContenidoFAMEX.textAlignment = .center
        lblHistoriaContenidoFAMEX.textColor = .white
        
        // Label OBJETIVOS
        lblObjetivosFAMEX.text = "OBJETIVOS"
        lblObjetivosFAMEX.font = UIFont(name: "Plateia", size: 30)
        lblObjetivosFAMEX.adjustsFontSizeToFitWidth = true
        lblObjetivosFAMEX.minimumScaleFactor = 0.5
        lblObjetivosFAMEX.textAlignment = .center
        lblObjetivosFAMEX.textColor = .white
        
            // Label contenido de Onjetivos
        lblObjetivosContenidoFAMEX.text = "Reunir a los mejores lideres de la industria y servicio de la aviación para favorecer el intercambio comercial e impulsar el crecimiento de la industria aeroespacial en distintas regiones del país."
        lblObjetivosContenidoFAMEX.numberOfLines = 0
        lblObjetivosContenidoFAMEX.adjustsFontSizeToFitWidth = true
        lblObjetivosContenidoFAMEX.minimumScaleFactor = 0.5
        lblObjetivosContenidoFAMEX.textAlignment = .center
        lblObjetivosContenidoFAMEX.textColor = .white
        
            // Label Por Que
        lblPorQue.text = "¿POR QUÉ MÉXICO?"
        lblPorQue.font = UIFont(name: "Plateia", size: 30)
        lblPorQue.adjustsFontSizeToFitWidth = true
        lblPorQue.minimumScaleFactor = 0.5
        lblPorQue.textAlignment = .center
        lblPorQue.textColor = .white
        
            //Label Contenido de Por Que Mexico
        lblPorQueContenido.text = "EVOLUCIÓN DE LA FERIA AEROESPACIAL EN MÉXICO"
        lblPorQueContenido.font = UIFont(name: "Plateia", size: 15)
        lblPorQueContenido.numberOfLines = 0
        lblPorQueContenido.adjustsFontSizeToFitWidth = true
        lblPorQueContenido.minimumScaleFactor = 0.5
        lblPorQueContenido.textAlignment = .center
        lblPorQueContenido.textColor = .white
        
            // Label del boton de Ediciones pasadas
        lblEdiPasadas.text = "EDICIONES\n PASADAS"
        lblEdiPasadas.numberOfLines = 0
        lblEdiPasadas.font = UIFont(name: "Arial", size: 20)
        lblEdiPasadas.textAlignment = .left
        lblEdiPasadas.textColor = .white
        
        // Botones
        btnEdiPasadas.round()
        btnEdiPasadas.bounce()
        
        
        /*
         ¿Qué es FAMEX? (se integra el objetivo)
         La Feria Aeroespacial México (FAMEX), es un evento organizado por la Secretaria de la Defensa Nacional (SEDENA) a través de la Fuerza Aérea Mexicana que integra actividades del ámbito aeronáutico civil, comercial, militar y de defensa.
         Historia
         La primera edición fue en el año 2015, con la finalidad de impulsar a México en el desarrollo económico del sector aeronáutico nacional, el responsable de la planeación, organización y materialización del evento fue el Comité Organizador.
         La misión de FAMEX es generar una atracción extranjera directa para crear empleos en la comunidad aeronáutica nacional, que promueva la aviación civil y militar, la tecnología y productos de defensa con sede en la Base Aérea militar No. 1 en Santa Lucia, Edo. Mex.
         Objetivo
         Reunir a los mejores lideres de la industria y servicio de la aviación para favorecer el intercambio comercial e impulsar el crecimiento de la industria aeroespacial en distintas regiones del país.

         
         */
        
    }
    
  
    
    // Metodo para personalizar el Navigation bar
    func customNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07022195309, green: 0.04930887371, blue: 0.1996642649, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "FAMEX"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "imgBtnHamburguesa")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(btnMenuHamburguesa))
    }
    
    // Actions
    @IBAction func btnActionEdiPasadas(_ sender: Any) {
        if let url = URL(string: "http://www.google.com") {
              if #available(iOS 10, *){
                  UIApplication.shared.open(url)
              }else{
                  UIApplication.shared.openURL(url)
              }
          }
    }
    
    
    // Accion del boton Hamburguesa
    @objc func btnMenuHamburguesa () {
        if menu == false {
            viewFamex.showMenu()
            menu = true
        }else if menu == true {
            viewFamex.hideMenu(viewOptionSelect: viewOptionSelect)
            menu = false
        }
    }
    
    

}
