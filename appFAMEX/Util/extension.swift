//
//  extension.swift
//  appFAMEX
//
//  Created by user223114 on 9/8/22.
//

import UIKit
import Foundation

/*--------------------------------------------------------------*/
// Extension de funcionalidad de los botones

extension UIButton {
    
    // Metodo para redondear bordes
    func round() {
        self.layer.cornerRadius = bounds.height / 3
        clipsToBounds = true
    }
    
    // Metodos de animacion
        // Metodo de animacion de rebote
    func bounce(){
        UIView.animate(withDuration: 0.1, animations: { self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (completion) in
            UIView.animate(withDuration: 0.1) {
                self.transform = .identity
            }
        }

    }
    
}

extension UIImageView {
    
    func round() {
        self.layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
}

// Extension de funcionalidad de las vistas
extension UIView {
    //  Metodo para desplegar el menu
    func showMenu() {
        print("Deplegar Menu")
        let screen = UIScreen.main.bounds
        self.layer.cornerRadius = 40
        let x = screen.width * 0.8
        let originalTransform = self.transform
        let scaledTransform = originalTransform.scaledBy(x: 0.9, y: 0.9)
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
        
        UIView.animate(withDuration: 0.7) {
            self.transform = scaledAndTranslatedTransform
        }
        
    }
    
    // Metodo para cerrar el menu
    func hideMenu(viewOptionSelect: CGAffineTransform) {
        print("Cerrar Menu")
        //var viewOptionSelect = CGAffineTransform()
        //viewOptionSelect = self.transform
        UIView.animate(withDuration: 0.7) {
            self.transform = viewOptionSelect
            self.layer.cornerRadius = 0
            self.layer.cornerRadius = self.layer.cornerRadius
        }
    }
    
    
    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0

        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }

    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0

        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }) { (completed) in
            self.isHidden = true
            completion(true)
        }
      }
    
    func fadeInAndOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0

        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            
            self.isHidden = false
            self.alpha = 1.0
            
        }) { (completed) in
            self.fadeOut(delay: 5)
            
            completion(true)
            
        }
            
    }
    
    
    
    func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat, bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat, left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    if let top = top {
    topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    if let bottom = bottom {
    bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
    }
    if let right = right {
    rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
    }
    if let left = left {
    leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }
    if width != 0 {
    widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    if height != 0 {
    heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    }
    

    
}


// Extension de funcionalidad del Navigation Bar
extension UINavigationController {
    // Metodo para personalizar el Navigation bar
    func customNavigationBar() {
        self.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        self.navigationBar.barStyle = .black
    }
}

// Extension de funcionalidad del Navigation Item (boton hamburguesa) *NOTA: NO SIRVE

extension UINavigationItem {
    
    
    func customNavigationItem(viewName:String) {
        self.title = viewName
        self.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "imgBtnHamburguesa")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(btnMenuHamburguesa))
    }
    
    // Actions
    // Accion del boton Hamburguesa
    @objc func btnMenuHamburguesa (view:UIView, viewOptionSelect: CGAffineTransform, menu:Bool) -> Bool{
        var menu = menu
        if menu == false {
            view.showMenu()
            menu = true
        }else if menu == true {
            view.hideMenu(viewOptionSelect: viewOptionSelect)
            menu = false
        }
        return menu
    }
    
    
    
    
}

extension UITableView {

    // Export pdf from UITableView and save pdf in drectory and return pdf file path
    func exportAsPdfFromTable() -> String {

        
        let originalBounds = self.bounds
        self.bounds = CGRect(x:originalBounds.origin.x, y: originalBounds.origin.y, width: self.contentSize.width, height: self.contentSize.height)
        let pdfPageFrame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.contentSize.height)

        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, pdfPageFrame, nil)
        UIGraphicsBeginPDFPageWithInfo(pdfPageFrame, nil)
        guard let pdfContext = UIGraphicsGetCurrentContext() else { return "" }
        self.layer.render(in: pdfContext)
        UIGraphicsEndPDFContext()
        self.bounds = originalBounds
        // Save pdf data
        return self.saveTablePdf(data: pdfData)

    }

    // Save pdf file in document directory
    func saveTablePdf(data: NSMutableData) -> String {

        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectoryPath = paths[0]
        let pdfPath = docDirectoryPath.appendingPathComponent("tablePdf1.pdf")
        if data.write(to: pdfPath, atomically: true) {
            return pdfPath.path
        } else {
            return ""
        }
    }
}

