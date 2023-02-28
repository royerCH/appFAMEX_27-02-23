//
//  franciaViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 08/09/22.
//

import UIKit

class franciaViewController: UIViewController, protocoloMenu {
    
    //-----------------------OUTLETS-----------------------
    
        // Views
    @IBOutlet weak var viewFrancia: UIView!
    @IBOutlet weak var viewMainButtons: UIView!
    @IBOutlet weak var viewSubButtons: UIView!
    
    
        // Buttons
    @IBOutlet weak var btnConferencias: UIButton!
    @IBOutlet weak var btnExpoEstatica: UIButton!
    @IBOutlet weak var btnChalets: UIButton!
    @IBOutlet weak var btnPuestosTrabajo: UIButton!
    @IBOutlet weak var btnLideresFrancia: UIButton!
    @IBOutlet weak var btnID: UIButton!
    @IBOutlet weak var btnExitoComercial: UIButton!
    
    
    var menu: Bool = false
    
    var viewOptionSelect: CGAffineTransform = CGAffineTransform()
    
   


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.0307629546, green: 0.1608202691, blue: 0.325432595, alpha: 1)

        viewOptionSelect = viewFrancia.transform
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
        
        // Views
        viewMainButtons.backgroundColor = .clear
        
        // Buttons

        
            // Clouser para subrallar
        let yourAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 14),
              .foregroundColor: UIColor.white,
              .underlineStyle: NSUnderlineStyle.single.rawValue
          ]
        
        let attributeString1 = NSMutableAttributedString(
                string: "Puestos de trabajo \nnumerosos y muy cualificados",
                attributes: yourAttributes
             )
        
        let attributeString2 = NSMutableAttributedString(
                string: "Muchos lideres \nmundiales en \nFrancia",
                attributes: yourAttributes
             )
        
        let attributeString3 = NSMutableAttributedString(
                string: "Una I+D fuerte e \ninternacionalizada",
                attributes: yourAttributes
             )

        let attributeString4 = NSMutableAttributedString(
                string: "Un éxito \ncomercial",
                attributes: yourAttributes
             )

        
        btnPuestosTrabajo.setAttributedTitle(attributeString1, for: .normal)
        btnPuestosTrabajo.titleLabel?.textAlignment = .center
        btnPuestosTrabajo.titleLabel?.numberOfLines = 0
        btnPuestosTrabajo.titleLabel?.adjustsFontSizeToFitWidth = true
        
        btnLideresFrancia.setAttributedTitle(attributeString2, for: .normal)
        btnLideresFrancia.titleLabel?.textAlignment = .center
        btnLideresFrancia.titleLabel?.numberOfLines = 0
        btnLideresFrancia.titleLabel?.adjustsFontSizeToFitWidth = true
        
        btnID.setAttributedTitle(attributeString3, for: .normal)
        btnID.titleLabel?.textAlignment = .center
        btnID.titleLabel?.numberOfLines = 0
        btnID.titleLabel?.adjustsFontSizeToFitWidth = true
        
        btnExitoComercial.setAttributedTitle(attributeString4, for: .normal)
        btnExitoComercial.titleLabel?.textAlignment = .center
        btnExitoComercial.titleLabel?.numberOfLines = 0
        btnExitoComercial.titleLabel?.adjustsFontSizeToFitWidth = true
    }

    func customNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "FRANCIA"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "imgBtnHamburguesa")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(btnMenuHamburguesa))
    }
    
    // ACTIONS
    
    @IBAction func btnActionConferenciasFrancia(_ sender: Any) {
        performSegue(withIdentifier: "conferenciasFranciaSegue", sender: self)
    }
    
    @IBAction func btnActionExpoEstaticaFrancia(_ sender: Any) {
        performSegue(withIdentifier: "expoEstaticaFranciaSegue", sender: self)
    }
    
    @IBAction func btnActionChaletsFrancia(_ sender: Any) {
        performSegue(withIdentifier: "chaletsFranciaSegue", sender: self)
    }
    
    
    @objc func btnMenuHamburguesa() {
        if menu == false {
            viewFrancia.showMenu()
            menu = true
        }else if menu == true {
            viewFrancia.hideMenu(viewOptionSelect: viewOptionSelect)
            menu = false
        }
    }
    
    

}
