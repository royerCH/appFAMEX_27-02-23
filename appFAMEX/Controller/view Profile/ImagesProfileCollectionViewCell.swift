//
//  ImagesProfileCollectionViewCell.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 07/12/22.
//

import UIKit

class ImagesProfileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewImageUser: UIView!
    @IBOutlet weak var imgUsr: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()

        viewImageUser.backgroundColor = .clear
        
    }

}

