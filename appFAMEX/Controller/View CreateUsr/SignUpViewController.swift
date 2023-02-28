//
//  createUsrViewController.swift
//  appFAMEX
//
//  Created by user223114 on 8/29/22.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var stackView: UIStackView!
    
        // Imagenes
    @IBOutlet weak var imgHomeFondo: UIImageView!
    @IBOutlet weak var imgLogoFamexBlanco2023: UIImageView!
    @IBOutlet weak var imgIconUsr: UIImageView!
    @IBOutlet weak var imgIconPass: UIImageView!
    @IBOutlet weak var imgIconPass2: UIImageView!
    

        // Botones
    @IBOutlet weak var btnCreateSession: UIButton!
    
        // views
    @IBOutlet weak var viewSignUp: UIView!
    @IBOutlet weak var viewLogoFAMEX: UIView!
    @IBOutlet weak var viewDataUsr: UIView!
    @IBOutlet weak var viewLineRef1: UIView!
    @IBOutlet weak var viewLineRef2: UIView!
    @IBOutlet weak var viewUsrLineRef: UIView!
    @IBOutlet weak var viewPassLineRef: UIView!
    @IBOutlet weak var viewPass2LineRef: UIView!
    @IBOutlet weak var viewButtons: UIView!
    
        // Text Fields
 
    @IBOutlet weak var textFieldUsr: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!
    @IBOutlet weak var textFieldPassConfirm: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customButton()
        
        // Delegar los Text Fields en el view controller (Esconder el keyboard)
        self.textFieldUsr.delegate = self
        self.textFieldPass.delegate = self
        self.textFieldPassConfirm.delegate = self
    }

    // Metodos
    
    private func customButton (){
        //-----------Personalizacion del boton Registrarse-----------
        btnCreateSession.layer.cornerRadius = 10
        btnCreateSession.setTitle("Registrarse", for: .normal)
        btnCreateSession.setTitleColor(.white, for: .normal)
        btnCreateSession.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
        
    }
    
    // Metodo para esconder el teclado al presionar Done en el Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldUsr.resignFirstResponder()
        textFieldPass.resignFirstResponder()
        textFieldPassConfirm.resignFirstResponder()
        
        return true
    }

}
