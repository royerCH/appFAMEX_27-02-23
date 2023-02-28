//
//  espectaculoViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 08/09/22.
//
import AVKit
import AVFoundation
import UIKit

class espectaculoViewController: UIViewController, protocoloMenu {
    
    @IBOutlet weak var viewEspectaculo: UIView!
    @IBOutlet weak var viewVideo: UIView!
    
    
    @IBOutlet weak var imgBGEspectaculo: UIImageView!
    @IBOutlet weak var imgTicket2: UIImageView!
    
    var menu: Bool = false
    
    var viewOptionSelect: CGAffineTransform = CGAffineTransform()
    
    var player: AVPlayer?
    

    
     //Se agrego override en función viewDidLoad
    override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = #colorLiteral(red: 0.0307629546, green: 0.1608202691, blue: 0.325432595, alpha: 1)
         
         // imgTicket2.fadeIn(duration: 1000) // Aun no sirve

         viewOptionSelect = viewEspectaculo.transform
         customNavigationBar()
         addchildController()
         viewVideo.backgroundColor = .clear
         playVideo()
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
        
        navigationItem.title = "ESPECTACULO AEREO"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "imgBtnHamburguesa")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(btnMenuHamburguesa))
    }
    
    @objc func btnMenuHamburguesa() {
        if menu == false {
            viewEspectaculo.showMenu()
            menu = true
        }else if menu == true {
            viewEspectaculo.hideMenu(viewOptionSelect: viewOptionSelect)
            menu = false
        }
    }
    
   
     func playVideo() {
         
         player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "videoEspectaculo", ofType: "mp4")!))
         let avPlayerViewController = AVPlayerViewController()
         avPlayerViewController.player = player
         avPlayerViewController.view.frame = viewVideo.bounds
         self.addChild(avPlayerViewController)
         self.viewVideo.addSubview(avPlayerViewController.view)
         avPlayerViewController.didMove(toParent: self)
         avPlayerViewController.videoGravity = .resizeAspectFill
         player?.play()
         
     }
     
     
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        if player != nil {
            player?.replaceCurrentItem(with: nil)
            player = nil
        }
    }
     
    
}
