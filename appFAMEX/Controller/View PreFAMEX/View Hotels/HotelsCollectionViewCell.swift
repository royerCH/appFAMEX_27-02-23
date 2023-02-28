//
//  HotelsCollectionViewCell.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 09/12/22.
//

import UIKit

class HotelsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var lblNightHotelCost: UILabel!
    @IBOutlet weak var lblNightHotelCostValue: UILabel!
    @IBOutlet weak var lblServices: UILabel!
    @IBOutlet weak var lblService1: UILabel!
    @IBOutlet weak var lblService2: UILabel!
    @IBOutlet weak var lblContacts: UILabel!
    @IBOutlet weak var lblContact1: UILabel!
    @IBOutlet weak var lblContact2: UILabel!
    
    @IBOutlet weak var viewCellHotels: UIView!
    
    @IBOutlet weak var btnReservationHotel: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCellHotels.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        viewCellHotels.layer.borderWidth = 2
        viewCellHotels.layer.borderColor = UIColor.white.cgColor
        
        lblNightHotelCost.text = "HOSPEDAJE POR NOCHE"
        lblNightHotelCost.textAlignment = .center
        lblNightHotelCost.textColor = .white
        lblNightHotelCost.font = .boldSystemFont(ofSize: 20)
        lblNightHotelCost.adjustsFontSizeToFitWidth = true
        lblNightHotelCost.minimumScaleFactor = 0.5
        
        lblServices.text = "SERVICIOS"
        lblServices.textAlignment = .center
        lblServices.textColor = .white
        lblServices.font = .boldSystemFont(ofSize: 20)
        lblServices.adjustsFontSizeToFitWidth = true
        lblServices.minimumScaleFactor = 0.5
        
        lblContacts.text = "CONTACTO"
        lblContacts.textAlignment = .center
        lblContacts.textColor = .white
        lblContacts.font = .boldSystemFont(ofSize: 20)
        lblContacts.adjustsFontSizeToFitWidth = true
        lblContacts.minimumScaleFactor = 0.5
        
        //cellBlock1?.lblNamePlane.layer.borderColor = UIColor.white.cgColor
        
        /*
         lblExpoEstaticaMex.text = "E\nX\nP\nO\nS\nI\nO\nN\n \nE\nS\nT\nA\nT\nI\nC\nA"
         lblExpoEstaticaMex.numberOfLines = 0
         lblExpoEstaticaMex.font = UIFont(name: "Arial", size: 40)
         lblExpoEstaticaMex.adjustsFontSizeToFitWidth = true
         lblExpoEstaticaMex.minimumScaleFactor = 0.5
         lblExpoEstaticaMex.textAlignment = .center
         lblExpoEstaticaMex.textColor = .white
         */
    }

}


