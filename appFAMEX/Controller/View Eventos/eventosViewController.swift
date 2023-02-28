//
//  eventosViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 08/09/22.
//

import UIKit
import PDFKit


class eventosViewController: UIViewController, protocoloMenu {
    
    // Views
    @IBOutlet weak var viewEventos: UIView!
    @IBOutlet weak var viewMainBtnMap: UIView!
    @IBOutlet weak var viewSubBtns: UIView!
    
    // Labels
    @IBOutlet weak var lblMapa: UILabel!
    @IBOutlet weak var lblEventosVertical: UILabel!
    
    // Buttons
    @IBOutlet weak var btnMapGeneral: UIButton!
    @IBOutlet weak var btnConferencias: UIButton!
    @IBOutlet weak var btnPabellones: UIButton!
    @IBOutlet weak var btnChalets: UIButton!
    @IBOutlet weak var btnExpoEstatica: UIButton!
    
    //let pdfView = PDFView ()
    var menu: Bool = false
    var viewOptionSelect: CGAffineTransform = CGAffineTransform()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.0307629546, green: 0.1608202691, blue: 0.325432595, alpha: 1)
        //self.modalPresentationStyle = .fullScreen
        
        viewOptionSelect = viewEventos.transform
        customViews()
        customNavigationBar()
        addchildController()
    }
    
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
        
        viewMainBtnMap.backgroundColor = .clear
        viewSubBtns.backgroundColor = .clear
        
        lblEventosVertical.text = " E\n V\n E\n N\n T\n O\n S"
        lblEventosVertical.numberOfLines = 0
        lblEventosVertical.textAlignment = .center
        lblEventosVertical.textColor = .white
        lblEventosVertical.font = UIFont(name: "Arial", size: 40)
        lblEventosVertical.adjustsFontSizeToFitWidth = true
        lblEventosVertical.minimumScaleFactor = 0.5
        
        lblMapa.text = "MAPA\n GENERAL"
        lblMapa.numberOfLines = 0
        lblMapa.textAlignment = .center
        lblMapa.textColor = .white
        lblMapa.font = UIFont(name: "Arial", size: 20)
        
        //lblEventosVertical.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        btnConferencias.setTitle("CONFERENCIAS", for: .normal)
        btnPabellones.setTitle("PABELLONES", for: .normal)
        btnChalets.setTitle("CHALETS", for: .normal)
        btnExpoEstatica.setTitle("EXPOSICION\n ESTATICA", for: .normal)
        btnExpoEstatica.titleLabel?.numberOfLines = 0
    }
    
    func customNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "EVENTOS"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "imgBtnHamburguesa")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(btnMenuHamburguesa))
    }
    
    @objc func btnMenuHamburguesa() {
        if menu == false {
            viewEventos.showMenu()
            menu = true
        }else if menu == true {
            viewEventos.hideMenu(viewOptionSelect: viewOptionSelect)
            menu = false
        }
    }
    
    @IBAction func btnActionMapGeneral(_ sender: Any) {
        pdf()
       
        performSegue(withIdentifier: "mapaGeneralSegue", sender: self)
      
    }
    
    @IBAction func btnActionExpoEstaticaMexico(_ sender: Any) {
        performSegue(withIdentifier: "expoEstaticaMexSegue", sender: self)
    }
    
    @IBAction func btnActionChaletsMexico(_ sender: Any) {
        performSegue(withIdentifier: "chaletsMexSegue", sender: self)
    }
    
    
    func pdf(){
        /*
        view.addSubview(pdfView)
        pdfView.displayDirection = .horizontal
        pdfView.frame = view.bounds
        guard let url = Bundle.main.url(forResource: "mapaGeneral", withExtension: "pdf") else { return }
        guard let document = PDFDocument(url: url) else { return }
        
        pdfView.document = document
 */
    }


}

