//
//  preparateViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 08/09/22.
//

import UIKit
import MapKit

class prefamexViewController: UIViewController, protocoloMenu {
    
    @IBOutlet weak var viewPreparate: UIView!
    @IBOutlet weak var viewLeftLineTop: UIView!
    @IBOutlet weak var viewRightLineTop: UIView!
    @IBOutlet weak var viewIconPreFAMEX: UIView!
    @IBOutlet weak var viewBtns: UIView!
    @IBOutlet weak var viewBtnHotels: UIView!
    @IBOutlet weak var viewBtnGetThere: UIView!
    @IBOutlet weak var viewBtnRoutes: UIView!
    @IBOutlet weak var viewBtnQuestions: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imgBGPreFamex: UIImageView!
    @IBOutlet weak var imgIconPreFAMEX: UIImageView!
    
    @IBOutlet weak var btnHotels: UIButton!
    @IBOutlet weak var btnGetThere: UIButton!
    @IBOutlet weak var btnRoutes: UIButton!
    @IBOutlet weak var btnQuestions: UIButton!
    
    @IBOutlet weak var lblGetReadyVertical: UILabel!
    
    let K = (latitude: 19.7479, longitude: -98.9727, companyName: "Campo Militar No.37-D")
    
    var menu: Bool = false
    
    var viewOptionSelect: CGAffineTransform = CGAffineTransform()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.0307629546, green: 0.1608202691, blue: 0.325432595, alpha: 1)

        viewOptionSelect = viewPreparate.transform
        customNavigationBar()
        addchildController()
        
        customViews()
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
    
    func customNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "PRE-FAMEX"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "imgBtnHamburguesa")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(btnMenuHamburguesa))
    }
    
    func customViews() {
        viewIconPreFAMEX.backgroundColor = .clear
        viewBtns.backgroundColor = .clear
        viewBtnHotels.backgroundColor = .clear
        viewBtnGetThere.backgroundColor = .clear
        viewBtnRoutes.backgroundColor = .clear
        viewBtnQuestions.backgroundColor = .clear
        
        lblGetReadyVertical.text = " P\n R\n E\n -\n F\n A\n M\n E\n X"
        lblGetReadyVertical.numberOfLines = 0
        lblGetReadyVertical.textAlignment = .center
        lblGetReadyVertical.textColor = .white
        lblGetReadyVertical.font = UIFont(name: "Arial", size: 40)
        lblGetReadyVertical.adjustsFontSizeToFitWidth = true
        lblGetReadyVertical.minimumScaleFactor = 0.5
        
        btnHotels.setTitle("   HOTELES", for: .normal)
        btnHotels.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        btnGetThere.setTitle("   ¿COMO LLEGAR?", for: .normal)
        btnGetThere.titleLabel?.numberOfLines = 0
        btnGetThere.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        btnRoutes.setTitle("   RUTAS", for: .normal)
        btnRoutes.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        btnQuestions.setTitle("        PREGUNTAS \n       FRECUENTES", for: .normal)
        btnQuestions.titleLabel?.numberOfLines = 0
        btnQuestions.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
    }
    
    func openMapForPlace() {
        
        
        let latitude: CLLocationDegrees = Double(K.latitude)
        let longitude: CLLocationDegrees = Double(K.longitude)
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = K.companyName
        mapItem.openInMaps(launchOptions: options)
        
    }
    
    @objc func btnMenuHamburguesa() {
        if menu == false {
            viewPreparate.showMenu()
            menu = true
        }else if menu == true {
            viewPreparate.hideMenu(viewOptionSelect: viewOptionSelect)
            menu = false
        }
    }
    
    @IBAction func btnActionHotels(_ sender: Any) {
        performSegue(withIdentifier: "hotelsSegue", sender: self)
    }
    
    @IBAction func btnActionGetThere(_ sender: Any) {
        openMapForPlace()
    }
    
    @IBAction func btnActionRoutes(_ sender: Any) {
        performSegue(withIdentifier: "routesSegue", sender: self)
    }
}
