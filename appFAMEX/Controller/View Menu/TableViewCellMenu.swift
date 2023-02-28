//
//  TableViewCellMenu.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 10/10/22.
//

import UIKit

class TableViewCellMenu: UITableViewCell {
    
    @IBOutlet weak var imgIconMenu: UIImageView!
    @IBOutlet weak var lblOptionMenu: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblOptionMenu.font = UIFont.boldSystemFont(ofSize: 20)
        //lblOptionMenu.font = UIFont(name: "Arial", size: 20)
        lblOptionMenu.textColor = .white
        
        backgroundColor = .clear    // Color de fonde de la selda
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
    }
    
}
