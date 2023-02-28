//
//  CustomCollectionViewCellRestaurantes.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 07/10/22.
//

import UIKit

class CustomCollectionViewCellRestaurantes: UICollectionViewCell {
    
    @IBOutlet weak var imgRestaurante: UIImageView!
    @IBOutlet weak var imgIconRestaurante: UIImageView!
    @IBOutlet weak var imgMenuRestaurante: UIImageView!
    @IBOutlet weak var imgBGCellRestaurante: UIImageView!
    
    
    
    @IBOutlet weak var lblNombreRestaurante: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        lblNombreRestaurante.font = UIFont.boldSystemFont(ofSize: 15)
        lblNombreRestaurante.textColor = .black
        lblNombreRestaurante.textAlignment = .center
    }

}
