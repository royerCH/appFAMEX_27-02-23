//
//  sanitizacionViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 08/09/22.
//

import UIKit
import PDFKit

class sanitizacionViewController: UIViewController {
    
    @IBOutlet weak var viewMapaSanitizacion: PDFView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        customNavigationBar()
        
        if let path = Bundle.main.path(forResource: "puntodesanitizacion", ofType: "pdf") {
            if let pdfDocument = PDFDocument(url: URL(fileURLWithPath: path)) {
                viewMapaSanitizacion.displayMode = .twoUpContinuous
                viewMapaSanitizacion.autoScales = true
                viewMapaSanitizacion.displayDirection = .horizontal
                viewMapaSanitizacion.document = pdfDocument
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    func customNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        

    }
    

}
