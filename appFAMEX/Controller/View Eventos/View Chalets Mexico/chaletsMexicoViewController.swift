//
//  chaletsMexicoViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 23/11/22.
//

import UIKit

class chaletsMexicoViewController: UIViewController {
    
    // MARK: - Views
        // Views
    @IBOutlet weak var viewNameChaletMex: UIView!
    @IBOutlet weak var viewChaletMex: UIView!
    @IBOutlet weak var viewImgLblChaletMex: UIView!
    
        // Images
    @IBOutlet weak var imgBGChaletMexico: UIImageView!
    @IBOutlet weak var imgBarraAuditorio: UIImageView!
    @IBOutlet weak var imgIconChaletsMex: UIImageView!
    
    
        // Labels
    @IBOutlet weak var lblChaletMex: UILabel!
    
    
        // Table View
    @IBOutlet weak var tableViewChaletMex: UITableView!
    
    
    //MARK: - Properties
    
        // Campos del objeto Chalet
    private struct structChaletMex {                   // Campos del Chalet
        var campNameChalet = String()       // Nombre del chalet
        var campDescriptChalet = String()   // Descripcion del chalet
        var campImgChalet = String()        // Nombre de la image del chalet
    }
    
        // Objeto Segmented Control
    private let segmentedControlBlocksChaletMex: UISegmentedControl = {
        
        let itemsValue: Array = ["Bloque 1", "Bloque 2", "Bloque 3"]
        let sc = UISegmentedControl(items: itemsValue )     // Se inicializa el segmented control
        sc.selectedSegmentIndex = 0                         // Posicion a desplegar del segmented control
        //sc.addTarget(self, action: #selector(handlesegmentChange), for: .valueChanged)  // Target (indicador) de la posicion del segmented control
        return sc
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

       
        viewImgLblChaletMex.backgroundColor = .clear
        lblChaletMex.text = "Chalets"
        lblChaletMex.textColor = .white

        
        
        
        let paddedStackviewMex = UIStackView(arrangedSubviews: [segmentedControlBlocksChaletMex])
        paddedStackviewMex.layoutMargins = .init(top: 12, left: 12, bottom: 12, right: 12)    // Margenes del segmentedControl
        paddedStackviewMex.isLayoutMarginsRelativeArrangement = true

        let stackViewMex = UIStackView(arrangedSubviews: [viewNameChaletMex, paddedStackviewMex, tableViewChaletMex])
        stackViewMex.axis = .vertical
        
        viewChaletMex.addSubview(stackViewMex)
        stackViewMex.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: .zero, bottom: view.bottomAnchor, paddingBottom: .zero, left: view.leftAnchor, paddingLeft: .zero, right: view.rightAnchor, paddingRight: .zero, width: 0, height: 0)
        
        tableViewChaletMex.delegate = self
        tableViewChaletMex.dataSource = self
        tableViewChaletMex.backgroundColor = .clear
        
        tableViewChaletMex.register(UINib(nibName: "TableViewCellChalet", bundle: nil), forCellReuseIdentifier: "cellChalet")
        
    }

}

    // MARK: - UITableViewDelegate, UITableViewDataSource
extension chaletsMexicoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellChalet", for: indexPath) as! TableViewCellChalet
        
        cell.backgroundColor = .clear
        
        return cell
    }
    
    
}
