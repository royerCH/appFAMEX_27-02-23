//
//  TableViewCellChalet.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 17/11/22.
//

import UIKit

class TableViewCellChalet: UITableViewCell {
    
    
    @IBOutlet weak var viewChalet: UIView!
    @IBOutlet weak var imgBGChalet: UIImageView!
    @IBOutlet weak var imgEmpresaChalet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewChalet.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
