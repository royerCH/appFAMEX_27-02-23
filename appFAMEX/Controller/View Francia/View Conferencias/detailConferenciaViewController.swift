//
//  detailConferenciaFranciaViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 09/11/22.
//

import UIKit

class detailConferenciaViewController: UIViewController {
    
    @IBOutlet weak var viewDetailConferenciaFrancia: UIView!
    @IBOutlet weak var viewMainInfo: UIView!
    @IBOutlet weak var viewSubInfo: UIView!
    @IBOutlet weak var viewDescription: UIView!
    
    @IBOutlet weak var lblTitleConferencia: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNameConferencista: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDateConferencia: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTimeConferencia: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblLocationConferencia: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    
    @IBOutlet weak var textViewDescriptionConferencia: UITextView!
    
    @IBOutlet weak var imgBG: UIImageView!
    @IBOutlet weak var imgCalendar: UIImageView!
    @IBOutlet weak var imgClock: UIImageView!
    @IBOutlet weak var imgLocation: UIImageView!
    
    var authorConferencia: String?
    var titleConferencia: String?
    var descriptionConferencia: String?
    var timeConferencia: String?
    var placeConferencia: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customViews()
        customNavigationBarPopUp()
    }
    
    func customViews() {
        
        viewMainInfo.layer.cornerRadius = 10
        viewSubInfo.layer.cornerRadius = 10
        viewDescription.layer.cornerRadius = 10
        
        lblNameConferencista.text = authorConferencia
        lblTitleConferencia.text = titleConferencia
        textViewDescriptionConferencia.text = descriptionConferencia
        lblTimeConferencia.text = timeConferencia
        lblLocationConferencia.text = placeConferencia
        
        
        lblName.text = "Conferencista:"
        
        lblDate.text = "Fecha:"
        lblTime.text = "Hora:"
        lblLocation.text = "Lugar:"
        
        lblDescription.text = "Descripciòn:"
        textViewDescriptionConferencia.isEditable = false
        
    }
    
    func customNavigationBarPopUp() {

        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor .white]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cerrar", style: .plain, target: self, action: #selector(btnClosePopUp))
        
    }
    
    @objc func btnClosePopUp () {
        
        dismiss(animated: true, completion: nil)
        
    }

}
