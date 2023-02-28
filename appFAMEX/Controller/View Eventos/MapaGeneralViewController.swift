//
//  MapaGeneralViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 06/10/22.
//

import UIKit
import PDFKit


 
 
 class MapaGeneralViewController: UIViewController {

     @IBOutlet weak var viewMapaGeneral: PDFView!
     override func viewDidLoad() {
         super.viewDidLoad()
         
         
         let value = UIInterfaceOrientation.landscapeLeft.rawValue
         UIDevice.current.setValue(value, forKey: "orientation")
         
         
         if let path = Bundle.main.path(forResource: "mapaGeneral", ofType: "pdf") {
             if let pdfDocument = PDFDocument(url: URL(fileURLWithPath: path)) {
                 viewMapaGeneral.displayMode = .twoUpContinuous
                 viewMapaGeneral.autoScales = true
                 viewMapaGeneral.displayDirection = .horizontal
                 viewMapaGeneral.document = pdfDocument
             }
         }
     }
     
     override var shouldAutorotate: Bool {
         return true
     }
     

 }
 
 



