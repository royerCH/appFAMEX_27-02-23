//
//  popUpAddMiItinerarioViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 25/11/22.
//

import UIKit

class popUpAddMiItinerarioViewController: UIViewController {
    
    // MARK: - Outlets
    
        // Views
    @IBOutlet weak var viewPopUpAddMiItinerario: UIView!
    
        // Labels
    @IBOutlet weak var lblAddMiItinerario: UILabel!
    

    // MARK: - View Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()

        customViews()
    }
    
    // MARK: - Methods
    func customViews () {
        
        lblAddMiItinerario.text =  "Se agrego a Mi Itinerario"
        lblAddMiItinerario.textColor = .black
        lblAddMiItinerario.textAlignment = .center
        
    }
    

    

    
    
    
  
}
