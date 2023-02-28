//
//  expoEstaticaFranciaCollectionViewCell.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 11/11/22.
//

import UIKit

class expoEstaticaFranciaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewCellExpoEstaticaFrancia: UIView!
    @IBOutlet weak var imgPlane: UIImageView!
    @IBOutlet weak var lblNamePlane: UILabel!
    

    override func awakeFromNib() {  // Funcion para configurar la celda
        super.awakeFromNib()
        viewCellExpoEstaticaFrancia.backgroundColor = .clear
        lblNamePlane.textAlignment = .center
        lblNamePlane.layer.cornerRadius = lblNamePlane.bounds.height / 2
        lblNamePlane.clipsToBounds = true
    }

}
