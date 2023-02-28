//
//  TableViewCellMiItinerario.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 10/11/22.
//

import UIKit

class TableViewCellMiItinerario: UITableViewCell {
    
    @IBOutlet weak var viewTableViewCell: UIView!
    
    @IBOutlet weak var lblTitleConferenciaMiItinerario: UILabel!
    @IBOutlet weak var lblDateConferenciaMiItinerario: UILabel!
    
    @IBOutlet weak var btnTrash: UIButton!
    @IBOutlet weak var btnInfo: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
