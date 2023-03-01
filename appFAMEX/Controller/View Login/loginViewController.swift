//
//  ViewController.swift
//  appFAMEX
//
//  Created by user223114 on 8/21/22.
//

import UIKit

class loginViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var scrollViewLogin: UIScrollView!
    
    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var viewDataUsr: UIView!
    @IBOutlet weak var viewLineRef: UIView!
    @IBOutlet weak var viewLogoFamex: UIView!
    @IBOutlet weak var viewUsrLineRef: UIView!
    @IBOutlet weak var viewPassLineRef: UIView!
    @IBOutlet weak var viewButtons: UIView!
    
    
    @IBOutlet weak var imgHomeFondo: UIImageView!
    @IBOutlet weak var imgLogoFamexBlanco2023: UIImageView!
    @IBOutlet weak var imgIconUsr: UIImageView!
    @IBOutlet weak var imgIconPass: UIImageView!
    
    @IBOutlet weak var textFieldUsr: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!

    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnGuessUsr: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var tipoIdioma: Int?
 
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Instancias de objetos de tipo LoginViewController
        
//         let tipoLenguaje = loginViewController()
        
        customButtons()
        /*----------------------------------------------------*/


        // Delegar los Text Fields en el view controller (Esconder el keyboard)
        self.textFieldUsr.delegate = self
        self.textFieldPass.delegate = self
        
    }

    // Metodos
    
        // Metodo para personalizar botones
    private func customButtons() {
        //-----------Personalizacion del boton Iniciar Sesion-----------
        btnLogIn.round() // Esquinas redondeadas
        btnLogIn.setTitle("Iniciar Sesión", for: .normal)     // Titulo del boton
        btnLogIn.titleLabel?.font = UIFont(name: "Plateia", size: 15)
        btnLogIn.titleLabel?.adjustsFontSizeToFitWidth = true
        btnLogIn.titleLabel?.minimumScaleFactor = 0.5
        btnLogIn.setTitleColor(.white, for: .normal)          // Color de letras
        btnLogIn.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)  // Color de fondo
        
        //-----------Personalizacion del boton Usuario Invitado-----------
        btnSignUp.setTitle("Registrarse", for: .normal)
        btnSignUp.titleLabel?.font = UIFont(name: "Plateia", size: 15)
        btnSignUp.titleLabel?.adjustsFontSizeToFitWidth = true
        btnSignUp.titleLabel?.minimumScaleFactor = 0.5
        btnSignUp.setTitleColor(.white, for: .normal)
        
        //-----------Personalizacion del boton Usuario Invitado-----------
        btnGuessUsr.round()
        btnGuessUsr.setTitle("Usuario Invitado", for: .normal)
        btnGuessUsr.titleLabel?.font = UIFont(name: "Plateia", size: 15)
        btnGuessUsr.titleLabel?.adjustsFontSizeToFitWidth = true
        btnGuessUsr.setTitleColor(.blue, for: .normal)
        btnGuessUsr.backgroundColor = .white
        
        // Activiy Indicator
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        activityIndicator.color = .white

       // print("Hello World")
    }
    
        // Metodo para esconder el teclado al presionar Done en el Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldUsr.resignFirstResponder()
        textFieldPass.resignFirstResponder()
        return true
    }
    
        // Metodo para desaparacer el navigation controller del login
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
        // Metodo para aparacer el navigation controller del Create
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    func passCredentials(credential: String) {
  
        profileViewController().UsrName = credential
    }
    
        // Actions
            // Iniciar sesion
     
     @IBAction func btnLogInAction(_ sender: Any) {
      
        btnLogIn.bounce() // Efecto de rebote
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.getUser(id: 1830) { (user) in
            // Peticion correcta
            self.activityIndicator.stopAnimating()
            
           // self.passCredentials(credential: "Hola")
            
            self.performSegue(withIdentifier: "logInSegue", sender: self)
            
        } failure: { (error) in
            // Ocurrio un Error
            self.activityIndicator.stopAnimating()
        }
     }
    
            // Registrarse
    @IBAction func btnSignUpAction(_ sender: Any) {
        btnSignUp.bounce()
        
        // Funcion para navegacion entre pantallas
                // Recibe 2 parametros:
                        // - Identificador del segue, tipo String ()
                        // - Sender, objeto que llama
        performSegue(withIdentifier: "signUpSegue", sender: self)
        
    }
    
    
     @IBAction func btnGuessUsrAction(_ sender: Any) {
         btnGuessUsr.bounce()
        tipoIdioma = 1
         performSegue(withIdentifier: "bienvenida", sender: self)
        print("btnGuessUSR funcionando")
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let screenView = segue.destination as?
            BienvenidaViewController{
            screenView.tipoIdioma = self.tipoIdioma
        }
    }

    
}


