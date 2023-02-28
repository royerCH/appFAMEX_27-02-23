	//
//  accesosViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 08/09/22.
//

import UIKit
import PDFKit

class accesosViewController: UIViewController {
    
    @IBOutlet weak var viewMapaAccesos: PDFView!
    
    // var menu: Bool = false
    
    // var viewOptionSelect: CGAffineTransform = CGAffineTransform()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")

        //viewOptionSelect = viewMapaAccesos.transform
        // customNavigationBar()
        
        if let path = Bundle.main.path(forResource: "accesosprioritarios", ofType: "pdf") {
            if let pdfDocument = PDFDocument(url: URL(fileURLWithPath: path)) {
                viewMapaAccesos.displayMode = .twoUpContinuous
                viewMapaAccesos.autoScales = true
                viewMapaAccesos.displayDirection = .horizontal
                viewMapaAccesos.document = pdfDocument
                
                //viewMapaAccesos.minScaleFactor = viewMapaAccesos.scaleFactorForSizeToFit
                //viewMapaAccesos.maxScaleFactor = 100.0
                //viewMapaAccesos.scaleFactor = viewMapaAccesos.scaleFactorForSizeToFit
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    func customNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "ACCESOS PRIORITARIOS"
    }


}
