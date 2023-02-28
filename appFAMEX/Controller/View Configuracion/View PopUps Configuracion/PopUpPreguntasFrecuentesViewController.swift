//
//  Preguntas Frecuentes.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 17/11/22.
//

import SwiftUI
class PopUpPreguntasFrecuentes: UIViewController {
override func viewDidLoad () {
    super.viewDidLoad()
    
    customViews()
    customNavigationBarPopUp()
    
}

    func customViews () {
        }
    
    
    
    func customNavigationBarPopUp() {

        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Atràs", style: .plain, target: self, action: #selector(btnClosePopUp))
           }
    
    @objc func btnClosePopUp () {
        
        dismiss(animated: true, completion: nil)
        }
        
    }
