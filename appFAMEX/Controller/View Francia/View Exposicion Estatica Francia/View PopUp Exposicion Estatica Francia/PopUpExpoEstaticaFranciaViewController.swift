//
//  PopUpExpoEstaticaFranciaViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 14/11/22.
//

import UIKit

class PopUpExpoEstaticaFranciaViewController: UIViewController {

    
    @IBOutlet weak var viewPopUp: UIView!
    @IBOutlet weak var viewImages: UIView!
    @IBOutlet weak var viewDescription: UIView!
    
    @IBOutlet weak var scrollViewPopUp: UIScrollView!
    
    @IBOutlet weak var stackViewPopUp: UIStackView!
    
    @IBOutlet weak var imgPopUp: UIImageView!
    @IBOutlet weak var imgBarraPopUp: UIImageView!
    
    
    @IBOutlet weak var lblTitlePopUp: UILabel!
    @IBOutlet weak var textViewDescription: UITextView!
    
    var titlePopUp: String?
    var imagenPopUP: UIImage?
    var imagenBarraPopUp: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewImages.backgroundColor = .clear
        viewDescription.backgroundColor = .clear
        
        textViewDescription.isEditable = false
        textViewDescription.backgroundColor = .clear
        
        lblTitlePopUp.textAlignment = .center
        lblTitlePopUp.text = titlePopUp
        imgPopUp.image = imagenPopUP
        imgBarraPopUp.image = imagenBarraPopUp

        customNavigationBarPopUp()
    }
    
    func customNavigationBarPopUp() {

        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor .white]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cerrar", style: .plain, target: self, action: #selector(btnClosePopUp))
        
    }
    
    @objc func btnClosePopUp () {
        
        dismiss(animated: true, completion: nil)
        
    }
    

}
