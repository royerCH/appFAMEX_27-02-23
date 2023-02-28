//
//  MenuModel.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 11/01/23.
//

import Foundation
import UIKit

class MenuModel {
    
    // Properties

    var myView: UIView?
    var myImage: UIImageView?
    var isOpenMenu = false
    let screen = UIScreen.main.bounds
    var inicio = CGAffineTransform()
    
    
    // Methods
    
    func showMenu(myImage: UIImageView) {
        
        myView!.layer.cornerRadius = 40
        myImage.layer.cornerRadius = myView!.layer.cornerRadius
        
        let x = screen.width * 0.8
        let originalTransform = myView!.transform
        let scaledTransform = originalTransform.scaledBy(x: 0.8, y: 0.8)
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
        UIView.animate(withDuration: 0.7) {
            self.myView!.transform = scaledAndTranslatedTransform
            
        }
        
    }
    
    func closeMenu(myImage: UIImageView) {
        
        UIView.animate(withDuration: 0.7) {
            self.myView!.transform = self.inicio
            self.myView!.layer.cornerRadius = 0
            self.myView!.layer.cornerRadius = self.myView!.layer.cornerRadius
        }
        
    }
    
    
    
}
