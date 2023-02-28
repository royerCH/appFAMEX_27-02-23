//
//  ConferenciasFranciaTableViewCell.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 09/11/22.
//

import UIKit

class ConferenciasFranciaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    
    @IBOutlet weak var imgBGCellConferencia: UIImageView!
    
    @IBOutlet weak var lblTitleConferencia: UILabel!
    @IBOutlet weak var lblTimeConferencia: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        

        lblTitleConferencia.numberOfLines = 0
        lblTitleConferencia.adjustsFontSizeToFitWidth = true
        lblTitleConferencia.minimumScaleFactor = 0.5
        lblTitleConferencia.textAlignment = .center
        lblTitleConferencia.textColor = .white
        
        lblTimeConferencia.numberOfLines = 0
        lblTimeConferencia.adjustsFontSizeToFitWidth = true
        lblTimeConferencia.minimumScaleFactor = 0.5
        lblTimeConferencia.textAlignment = .center
        lblTimeConferencia.textColor = .white

        
        btnAdd.backgroundColor = .white
        btnAdd.layer.cornerRadius = btnAdd.bounds.height / 2
        btnAdd.clipsToBounds = true
        
        btnInfo.backgroundColor = .white
        btnInfo.layer.cornerRadius = btnInfo.bounds.height / 2
        btnInfo.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}
