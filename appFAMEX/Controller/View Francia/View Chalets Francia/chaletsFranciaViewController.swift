//
//  chaletsFranciaViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 17/11/22.
//

import UIKit

class chaletsFranciaViewController: UIViewController {
    
    // MARK: - Views
        // Views
    @IBOutlet weak var viewNameChaletFrancia: UIView!
    @IBOutlet weak var viewChaletFrancia: UIView!
    @IBOutlet weak var viewImgLblChalet: UIView!
    
    @IBOutlet weak var lblChalet: UILabel!
    
    
        // Picker
    @IBOutlet weak var pickerViewChalet: UIPickerView!
    
        // Table View
    @IBOutlet weak var tableViewChaletFrancia: UITableView!
    
    
    //MARK: - Properties
    
        // Campos del objeto Chalet
    private struct structChalet {                   // Campos del Chalet
        var campNameChalet = String()       // Nombre del chalet
        var campDescriptChalet = String()   // Descripcion del chalet
        var campImgChalet = String()        // Nombre de la image del chalet
    }
    
        // Arreglo con el nombre de los bloques
    private let pickerViewValue: Array = ["Bloque 1", "Bloque 2", "Bloque 3"]
    
        // Objeto Segmented Control
    private let segmentedControlBlocksChalet: UISegmentedControl = {
        
        let itemsValue: Array = ["Bloque 1", "Bloque 2", "Bloque 3"]
        let sc = UISegmentedControl(items: itemsValue )     // Se inicializa el segmented control
        sc.selectedSegmentIndex = 0                         // Posicion a desplegar del segmented control
        //sc.addTarget(self, action: #selector(handlesegmentChange), for: .valueChanged)  // Target (indicador) de la posicion del segmented control
        return sc
        
    }()
    
    var rotationAngelPickerViewPabellones: CGFloat!
    let widht: CGFloat = 100
    let heigth: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        
            // PickerView
        //pickerViewChalet.delegate = self
        //pickerViewChalet.dataSource = self
        //customPickerView()
        //createHighlightView()
        
        viewImgLblChalet.backgroundColor = .clear
        lblChalet.text = "Chalets"
        lblChalet.textColor = .white

        
        
        
        let paddedStackview = UIStackView(arrangedSubviews: [segmentedControlBlocksChalet])
        paddedStackview.layoutMargins = .init(top: 12, left: 12, bottom: 12, right: 12)    // Margenes del segmentedControl
        paddedStackview.isLayoutMarginsRelativeArrangement = true

        let stackView = UIStackView(arrangedSubviews: [viewNameChaletFrancia, paddedStackview, tableViewChaletFrancia])
        stackView.axis = .vertical
        
        viewChaletFrancia.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: .zero, bottom: view.bottomAnchor, paddingBottom: .zero, left: view.leftAnchor, paddingLeft: .zero, right: view.rightAnchor, paddingRight: .zero, width: 0, height: 0)
        
        tableViewChaletFrancia.delegate = self
        tableViewChaletFrancia.dataSource = self
        tableViewChaletFrancia.backgroundColor = .clear
        
        tableViewChaletFrancia.register(UINib(nibName: "TableViewCellChalet", bundle: nil), forCellReuseIdentifier: "cellChalet")
        
    }
    
    // MARK: - Methods
    
    func customPickerView () {
        
            // Picker View Rotation
        rotationAngelPickerViewPabellones = -90 * (.pi/180)
        pickerViewChalet.transform = CGAffineTransform(rotationAngle: rotationAngelPickerViewPabellones)
        pickerViewChalet.backgroundColor = .clear
        pickerViewChalet.layer.cornerRadius = 10
        
        
    }
    
    func createHighlightView() {

        let highlightView = UIView(frame: CGRect.zero)
        highlightView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        highlightView.layer.cornerRadius = 30

        /*
         Now lets programmatically add constraints
         */
        highlightView.translatesAutoresizingMaskIntoConstraints = false
        pickerViewChalet.addSubview(highlightView)

        //HightLight View's width
        highlightView.addConstraint(NSLayoutConstraint(item: highlightView,
                                                       attribute: .width,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1,
                                                       constant: 100))

        //HightLight View's height
        highlightView.addConstraint(NSLayoutConstraint(item: highlightView,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1,
                                                       constant: 100))

        //HightLight View should be bang center-aligned with pickerView
        pickerViewChalet.addConstraint(NSLayoutConstraint(item: highlightView,
                                                    attribute: .centerX,
                                                    relatedBy: .equal,
                                                    toItem: pickerViewChalet,
                                                    attribute: .centerX,
                                                    multiplier: 1,
                                                    constant: 0))
        pickerViewChalet.addConstraint(NSLayoutConstraint(item: highlightView,
                                                    attribute: .centerY,
                                                    relatedBy: .equal,
                                                    toItem: pickerViewChalet,
                                                    attribute: .centerY,
                                                    multiplier: 1,
                                                    constant: 0))
    }


}

    // MARK: - UITableViewDelegate, UITableViewDataSource
extension chaletsFranciaViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellChalet", for: indexPath) as! TableViewCellChalet
        
        cell.backgroundColor = .clear
        
        return cell
    }
    
    
}

    // MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension chaletsFranciaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewValue.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewValue[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewChalet.reloadAllComponents()
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: widht, height: 50)
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: widht, height: heigth)
        label.textAlignment = .center
        label.text = pickerViewValue[row]
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        view.addSubview(label)
        
        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        
        if pickerViewChalet.selectedRow(inComponent: component) == row {
            label.attributedText =  NSAttributedString(string: pickerViewValue[row], attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor:UIColor.black])
            }
       
        
        
        return view
    }
    
    
}

