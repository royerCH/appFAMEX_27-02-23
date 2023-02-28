//
//  PopUpFranciaViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 30/09/22.
//

import UIKit

class PopUpPuestosViewController: UIViewController {
    
    
    @IBOutlet var viewPopUpPuestos: UIView!
    @IBOutlet weak var viewImgAvion: UIView!
    @IBOutlet weak var viewTextAvion: UIView!
    @IBOutlet weak var textAvion: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        customViews()
        customNavigationBarPopUp()
        
    }
    
    func customViews () {
        viewImgAvion.backgroundColor = .clear
        viewTextAvion.backgroundColor = .clear
        
        textAvion.backgroundColor = .clear
        textAvion.textColor = .white
        textAvion.isEditable = false
        
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
