//
//  routesViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 16/12/22.
//

import UIKit

class routesViewController: UIViewController {
    
    @IBOutlet weak var viewRoutes: UIView!
    @IBOutlet weak var viewHeaderRoutes: UIView!
    @IBOutlet weak var viewRefLineLeft: UIView!
    @IBOutlet weak var viewRefLineRight: UIView!
    @IBOutlet weak var viewCircuit: UIView!
    @IBOutlet weak var viewContainerHotelsExternalFair: UIView!
    @IBOutlet weak var viewExternal: UIView!
    @IBOutlet weak var viewLblExternal: UIView!
    @IBOutlet weak var viewHotels: UIView!
    @IBOutlet weak var ViewLblHotels: UIView!
    @IBOutlet weak var viewFerial: UIView!
    @IBOutlet weak var viewLblFerial: UIView!
    @IBOutlet weak var subViewExternal: UIView!
    @IBOutlet weak var subViewHotels: UIView!
    @IBOutlet weak var subViewFerial: UIView!
    
    @IBOutlet weak var imgBGRoutes: UIImageView!
    @IBOutlet weak var imgIconRoutes: UIImageView!
    @IBOutlet weak var imgCycleArrow: UIImageView!
    @IBOutlet weak var imgIconMilitaryBase: UIImageView!
    @IBOutlet weak var imgLogoFamexExternal: UIImageView!
    @IBOutlet weak var imgCycleArrowHotels: UIImageView!
    @IBOutlet weak var imgIconHotels: UIImageView!
    @IBOutlet weak var imgLogoFamexHotels: UIImageView!
    @IBOutlet weak var imgIconChalet: UIImageView!
    @IBOutlet weak var imgIconChaletLeft: UIImageView!
    @IBOutlet weak var imgIconChaletRight: UIImageView!
    @IBOutlet weak var imgGolfCart: UIImageView!
    @IBOutlet weak var imgCurvyArrow: UIImageView!
    @IBOutlet weak var imgCurvyArrowLeft: UIImageView!
    @IBOutlet weak var imgCurvyArrowRight: UIImageView!
    
    @IBOutlet weak var lblMilitaryBase: UILabel!
    @IBOutlet weak var lblEnclousureFairExternal: UILabel!
    @IBOutlet weak var lblHotel: UILabel!
    @IBOutlet weak var lblEnclousureFairHotel: UILabel!
    @IBOutlet weak var lblBlock2: UILabel!
    @IBOutlet weak var lblBlock1: UILabel!
    @IBOutlet weak var lblBlock3: UILabel!
    @IBOutlet weak var lblCircuit: UILabel!
    @IBOutlet weak var lblHotels: UILabel!
    @IBOutlet weak var lblExternal: UILabel!
    @IBOutlet weak var lblFerial: UILabel!
    @IBOutlet weak var lblRouts: UILabel!
    
    @IBOutlet weak var btnExternal: UIButton!
    @IBOutlet weak var btnHotels: UIButton!
    @IBOutlet weak var btnFerial: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customViews()
        customLabels()

    }
    

    func customViews() {
        
        viewContainerHotelsExternalFair.backgroundColor = .clear
        
        viewCircuit.backgroundColor = #colorLiteral(red: 0.09967335314, green: 0.1554190814, blue: 0.2301730812, alpha: 1).withAlphaComponent(0.7)
        viewCircuit.layer.cornerRadius = 5
        
        viewHotels.backgroundColor = .clear
        ViewLblHotels.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        ViewLblHotels.layer.cornerRadius = 10
        subViewHotels.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        subViewHotels.layer.cornerRadius = 10
        
        viewExternal.backgroundColor = .clear
        viewLblExternal.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        viewLblExternal.layer.cornerRadius = 10
        subViewExternal.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        subViewExternal.layer.cornerRadius = 10
        
        viewFerial.backgroundColor = .clear
        viewLblFerial.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        viewLblFerial.layer.cornerRadius = 10
        subViewFerial.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        subViewFerial.layer.cornerRadius = 10
        
    }
    
    func customLabels() {
        
        lblRouts.text = "RUTAS"
        lblRouts.font = UIFont(name: "Arial", size: 40)
        lblRouts.adjustsFontSizeToFitWidth = true
        lblRouts.minimumScaleFactor = 0.5
        lblRouts.textAlignment = .center
        lblRouts.textColor = .white
        
        lblCircuit.text = "C\nI\nR\nC\nU\nL\nA\nC\nI\nO\nN"
        lblCircuit.numberOfLines = 0
        lblCircuit.textAlignment = .center
        lblCircuit.textColor = .white
        lblCircuit.font = UIFont(name: "Arial", size: 40)
        lblCircuit.adjustsFontSizeToFitWidth = true
        lblCircuit.minimumScaleFactor = 0.5
        
        lblHotels.text = " H\n O\n T\n E\n L\n E\n S"
        lblHotels.numberOfLines = 0
        lblHotels.textAlignment = .center
        lblHotels.textColor = .white
        lblHotels.font = UIFont(name: "Arial", size: 20)
        lblHotels.adjustsFontSizeToFitWidth = true
        lblHotels.minimumScaleFactor = 0.5
        
        lblHotel.text = "HOTEL"
        lblHotel.adjustsFontSizeToFitWidth = true
        lblHotel.minimumScaleFactor = 0.5
        lblHotel.textAlignment = .center
        lblHotel.textColor = .white
        
        lblEnclousureFairHotel.text = "RECINTO\n FERIAL"
        lblEnclousureFairHotel.numberOfLines = 0
        lblEnclousureFairHotel.adjustsFontSizeToFitWidth = true
        lblEnclousureFairHotel.minimumScaleFactor = 0.5
        lblEnclousureFairHotel.textAlignment = .center
        lblEnclousureFairHotel.textColor = .white
        
        lblExternal.text = " E\n X\n T\n E\n R\n N\n O"
        lblExternal.numberOfLines = 0
        lblExternal.textAlignment = .center
        lblExternal.textColor = .white
        lblExternal.font = UIFont(name: "Arial", size: 20)
        lblExternal.adjustsFontSizeToFitWidth = true
        lblExternal.minimumScaleFactor = 0.5
        
        lblMilitaryBase.text = "BASE\n MILITAR"
        lblMilitaryBase.numberOfLines = 0
        lblMilitaryBase.adjustsFontSizeToFitWidth = true
        lblMilitaryBase.minimumScaleFactor = 0.5
        lblMilitaryBase.textAlignment = .center
        lblMilitaryBase.textColor = .white
        
        lblEnclousureFairExternal.text = "RECINTO\n FERIAL"
        lblEnclousureFairExternal.numberOfLines = 0
        lblEnclousureFairExternal.adjustsFontSizeToFitWidth = true
        lblEnclousureFairExternal.minimumScaleFactor = 0.5
        lblEnclousureFairExternal.textAlignment = .center
        lblEnclousureFairExternal.textColor = .white
        
        lblFerial.text = " F\n E\n R\n I\n A\n L"
        lblFerial.numberOfLines = 0
        lblFerial.textAlignment = .center
        lblFerial.textColor = .white
        lblFerial.font = UIFont(name: "Arial", size: 20)
        lblFerial.adjustsFontSizeToFitWidth = true
        lblFerial.minimumScaleFactor = 0.5
        
        lblBlock1.text = "BLOQUE 1"
        lblBlock1.adjustsFontSizeToFitWidth = true
        lblBlock1.minimumScaleFactor = 0.5
        lblBlock1.textAlignment = .center
        lblBlock1.textColor = .white
        
        lblBlock2.text = "BLOQUE 2"
        lblBlock2.adjustsFontSizeToFitWidth = true
        lblBlock2.minimumScaleFactor = 0.5
        lblBlock2.textAlignment = .center
        lblBlock2.textColor = .white
        
        lblBlock3.text = "BLOQUE 3"
        lblBlock3.adjustsFontSizeToFitWidth = true
        lblBlock3.minimumScaleFactor = 0.5
        lblBlock3.textAlignment = .center
        lblBlock3.textColor = .white
        
    }

}
