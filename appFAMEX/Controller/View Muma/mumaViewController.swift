//
//  mumaViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 08/09/22.
//

import UIKit
import WebKit

class mumaViewController: UIViewController, protocoloMenu {
    
    @IBOutlet weak var viewMuma: UIView!
    @IBOutlet weak var webViewMUMA: WKWebView!
    
    var menu: Bool = false
    
    var viewOptionSelect: CGAffineTransform = CGAffineTransform()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        view.backgroundColor = #colorLiteral(red: 0.0307629546, green: 0.1608202691, blue: 0.325432595, alpha: 1)

        viewOptionSelect = viewMuma.transform
        customNavigationBar()
        addchildController()
        
        openExhibition()
        
    }
    
    override var shouldAutorotate: Bool {
        return true
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
        
        navigationItem.title = "MUMA"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "imgBtnHamburguesa")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(btnMenuHamburguesa))
    }
    
    @objc func btnMenuHamburguesa() {
        if menu == false {
            viewMuma.showMenu()
            menu = true
        }else if menu == true {
            viewMuma.hideMenu(viewOptionSelect: viewOptionSelect)
            menu = false
        }
    }
    
    func openExhibition() {
        
        let urlMUMA = "https://webobook.com/public/62e35877f7f4f4058c1e32f2,en#"
        
        webViewMUMA.load(URLRequest(url: URL(string: urlMUMA)!))
        
    }

}
