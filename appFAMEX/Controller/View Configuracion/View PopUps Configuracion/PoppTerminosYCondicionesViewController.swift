//
//  PoppTerminosYCondicionesViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 17/11/22.
//

import SwiftUI

class PopUpTerminosYCondiciones: UIViewController {
    
    
    @IBOutlet weak var viewImgTerminos: UIView!
    
    
    override func viewDidLoad() {
    CustomViews()
    }
    
    
    func CustomViews () {
        viewImgTerminos.backgroundColor = .clear
    }
    
    func customNavigationBarPopUp () {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
    }
    
    @objc func btnClosePopUp () {
        dismiss(animated: true, completion: nil)
        
    }
}
