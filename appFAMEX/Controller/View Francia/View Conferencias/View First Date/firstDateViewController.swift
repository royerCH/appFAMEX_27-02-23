//
//  firstDateViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 08/11/22.
//

import UIKit
import CoreData
import Foundation


struct conferenciaModelo: Codable {
    let articles: [ConferenciaFrancia]
}

struct ConferenciaFrancia: Codable {             // Campos de la conferencia Francia
    
    let title: String?          // Titulo de la conferencia
    let author: String?         // Conferencista
    let description: String?    // Descripcion
    let url: String?            // Lugar
    let urlToImage:String?      // hora
    let publishedAt: String?    // Fecha
    
}

class firstDateViewController: UIViewController {
    
    // MARK: - Outlets
    
        // Views
    @IBOutlet weak var viewFirstDateFrancia: UIView!
    @IBOutlet weak var viewNamePabellon: UIView!

        // Table View
    
    @IBOutlet weak var tableViewConferenciasFrancia: UITableView!
    
        // Images
    @IBOutlet weak var imgBG: UIImageView!
    @IBOutlet weak var imgIconPabellon: UIImageView!
    
        // Labels
    @IBOutlet weak var lblNameAuditorio: UILabel!
    @IBOutlet weak var lblNamePabellon: UILabel!
    
        // Buttons
    @IBOutlet weak var btnRightPabellon: UIButton!
    @IBOutlet weak var btnLeftPabellon: UIButton!
    
        // Segmented Control
    let segmentedControl: UISegmentedControl = {                                        // Objeto Segmented Control
        let sc = UISegmentedControl(items: ["A", "B", "C", "D", "E", "F"])              // Nombre de pabellones
        sc.selectedSegmentIndex = 0     // Posicion a desplegar del segmented control
        sc.addTarget(self, action: #selector(handlesegmentChange), for: .valueChanged)  // Target (indicador) de la posicion del segmented control
        return sc
    }()

    // MARK: - Properties
    
    var conferenciaFamex : [ConferenciaFrancia] = []
    
    var itinerario = [ITINERARIO]() // Arreglo de objetos de tipo ITINERARIO (base de datos local)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext   // Referencia a la base de datos


        // Tupla de pabellones
    typealias tuplePabelllones = (pabellonName: String, auditorioName: String)
        // Arreglo de pabellones
    var arrayPabellones: [tuplePabelllones] = [
        ("Pabellon A", "Auditrio Alfa"),
        ("Pabellon B", "Auditrio Bravo"),
        ("Pabellon C", "Auditrio Charlie"),
        ("Pabellon D", "Auditrio Delta"),
        ("Pabellon E", "Auditrio Eco"),
        ("Pabellon F", "Auditrio Foxtrot")
    ]
    
    
    let pabellonA = [" Conferencia Francia A1", " Conferencia Francia A2", " Conferencia Francia A3", " Conferencia Francia A4", " Conferencia Francia A5"]
    
    let pabellonB = [" Conferencia Francia B1", " Conferencia Francia B2", " Conferencia Francia B3", " Conferencia Francia B4", " Conferencia Francia B5"]
    
    let pabellonC = [" Conferencia Francia C1", " Conferencia Francia C2", " Conferencia Francia C3", " Conferencia Francia C4", " Conferencia Francia C5"]
    
    let pabellonD = [" Conferencia Francia D1", " Conferencia Francia D2", " Conferencia Francia D3", " Conferencia Francia D4", " Conferencia Francia D5"]
    
    let pabellonE = [" Conferencia Francia E1", " Conferencia Francia E2", " Conferencia Francia E3", " Conferencia Francia E4", " Conferencia Francia E5"]
    
    let pabellonF = [" Conferencia Francia F1", " Conferencia Francia F2", " Conferencia Francia F3", " Conferencia Francia F4", " Conferencia Francia F5"]
    
    lazy var rowsToDisplay = pabellonA  // Indicador del pabellon a desplegar
    
    
    // MARK: - View Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()

            // Delegados de la table view
        tableViewConferenciasFrancia.dataSource = self
        tableViewConferenciasFrancia.delegate = self
            // Registro de las celdas reutilizables
        tableViewConferenciasFrancia.register(UINib(nibName: "ConferenciasFranciaTableViewCell", bundle: nil), forCellReuseIdentifier: "cellFrancia")
        
        customViews()
        findConferencias()
        //callAPI()
        //decodeAPI()
        
        //print(conferencias.count)
        
    }
    
    // MARK: - Methods
    
        // Funcion para personalizar las views
    func customViews() {
        
            // Viewa
        viewNamePabellon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        viewNamePabellon.backgroundColor = .clear
        
            // Segmented Control
        let paddedStackview = UIStackView(arrangedSubviews: [segmentedControl])
        paddedStackview.layoutMargins = .init(top: 12, left: 12, bottom: 12, right: 12)    // Margenes del segmentedControl
        paddedStackview.isLayoutMarginsRelativeArrangement = true
        
            // Table view
        tableViewConferenciasFrancia.backgroundColor = .clear
        
            // Stack view
        let stackView = UIStackView(arrangedSubviews: [viewNamePabellon, paddedStackview,  tableViewConferenciasFrancia])
        stackView.axis = .vertical
            
            // Agregar el Stack view a la view viewFirstDateFrancia
        viewFirstDateFrancia.addSubview(stackView)
        
            // Margenes del Stack view
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 12, bottom: view.bottomAnchor, paddingBottom: .zero, left: view.leftAnchor, paddingLeft: .zero, right: view.rightAnchor, paddingRight: .zero, width: 0, height: 0)
        
            // Buttons
        btnRightPabellon.tag = 0        // Identificador o tag del boton Derecho
        btnRightPabellon.round()
        btnRightPabellon.backgroundColor = .white
        
        btnLeftPabellon.tag = 1         // Identificador o tag del boton Izquierdo
        btnLeftPabellon.round()
        btnLeftPabellon.backgroundColor = .white
            
            // Labels
        lblNameAuditorio.text = "Auditorio Alfa"
        lblNameAuditorio.textAlignment = .center
        lblNameAuditorio.textColor = .white
        
        lblNamePabellon.text = "Pabellon A"
        lblNamePabellon.textAlignment = .center
        lblNamePabellon.textColor = .white
    }
    
        // Funcion para desplegar el pop up "Agregar a mi itinerario"
    private func showPopUpAddMiItinerario () -> UIView {
        
        let popUpSeeItinerarioVC = storyboard!.instantiateViewController(withIdentifier: "seeMiItinerario")
        self.addChild(popUpSeeItinerarioVC)
        popUpSeeItinerarioVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popUpSeeItinerarioVC.view)
        popUpSeeItinerarioVC.view.anchor(top: .none, paddingTop: .zero , bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 5, left: view.leftAnchor, paddingLeft: 5, right: view.rightAnchor, paddingRight: 5, width: 0, height: 50)
        //popUpSeeItinerarioVC.view.isHidden = true
        popUpSeeItinerarioVC.view.layer.cornerRadius = 10
        popUpSeeItinerarioVC.view.clipsToBounds = true
        popUpSeeItinerarioVC.didMove(toParent: self)
        self.view.bringSubviewToFront(popUpSeeItinerarioVC.view)
        
        return popUpSeeItinerarioVC.view
        
    }
    
    func findConferencias() {
        let urlString = "https://newsapi.org/v2/top-headlines?country=mx&apiKey=587c18270e92411fbb5f311dbbb9b390"
        
        print("hola 1")
        
        if let url = URL(string: urlString) {
            
            print("hola 2")
            
            if let data = try? Data(contentsOf: url) {
                
                print("hola 3")
                
                let decodificador = JSONDecoder()
                
                if let datosDecodificados = try? decodificador.decode(conferenciaModelo.self, from: data) {
                    
                    print("hola 4")
                    
                    print("datosDecodificados: \(datosDecodificados.articles.count)")
                    
                    conferenciaFamex = datosDecodificados.articles
                    tableViewConferenciasFrancia.reloadData()
                }
            }
        }
    }
    /*
    func callAPI(){
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=mx&apiKey=587c18270e92411fbb5f311dbbb9b390") else{
            return
        }


        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let data = data, let string = String(data: data, encoding: .utf8){
                print("**********************hola 1*********************")
                print(string)
                print(string.count)
            }
        }

        task.resume()
    }
    
    
    func decodeAPI(){
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=mx&apiKey=587c18270e92411fbb5f311dbbb9b390") else{return}

        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            let decoder = JSONDecoder()

            if let data = data{
                do{
                    let tasks = try decoder.decode(conferenciaModel.self, from: data)
                    print(tasks)
                }catch{
                    print(error)
                    print("Ocurrio un error")
                }
            }
        }
        task.resume()

    }
   */
    
    
    
    // MARK: - Action Methods
    
        // Funcion para desplegar las celdas
    @objc fileprivate func handlesegmentChange() {
        print(segmentedControl.selectedSegmentIndex)
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            lblNameAuditorio.text = arrayPabellones[segmentedControl.selectedSegmentIndex].auditorioName
            lblNamePabellon.text = arrayPabellones[segmentedControl.selectedSegmentIndex].pabellonName
            rowsToDisplay = pabellonA
        case 1:
            lblNameAuditorio.text = arrayPabellones[segmentedControl.selectedSegmentIndex].auditorioName
            lblNamePabellon.text = arrayPabellones[segmentedControl.selectedSegmentIndex].pabellonName
            rowsToDisplay = pabellonB
        case 2:
            lblNameAuditorio.text = arrayPabellones[segmentedControl.selectedSegmentIndex].auditorioName
            lblNamePabellon.text = arrayPabellones[segmentedControl.selectedSegmentIndex].pabellonName
            rowsToDisplay = pabellonC
        case 3:
            lblNameAuditorio.text = arrayPabellones[segmentedControl.selectedSegmentIndex].auditorioName
            lblNamePabellon.text = arrayPabellones[segmentedControl.selectedSegmentIndex].pabellonName
            rowsToDisplay = pabellonD
        case 4:
            lblNameAuditorio.text = arrayPabellones[segmentedControl.selectedSegmentIndex].auditorioName
            lblNamePabellon.text = arrayPabellones[segmentedControl.selectedSegmentIndex].pabellonName
            rowsToDisplay = pabellonE
        default:
            lblNameAuditorio.text = arrayPabellones[segmentedControl.selectedSegmentIndex].auditorioName
            lblNamePabellon.text = arrayPabellones[segmentedControl.selectedSegmentIndex].pabellonName
            rowsToDisplay = pabellonF
        }
        
        tableViewConferenciasFrancia.reloadData()
        
    }
    
        // Funcion para cambiar entre pabellones con los botones
    @IBAction func btnActionMoveSegmentedControl(_ sender: UIButton) {
        
        if sender.tag == 0 {
            btnRightPabellon.bounce()
            segmentedControl.selectedSegmentIndex += 1
            
            print(segmentedControl.selectedSegmentIndex)
            handlesegmentChange()
        } else {
            btnLeftPabellon.bounce()
            segmentedControl.selectedSegmentIndex -= 1
            
            if segmentedControl.selectedSegmentIndex == -1 {
                segmentedControl.selectedSegmentIndex = 0
                handlesegmentChange()
            }
        
            handlesegmentChange()
            
        }
        
        
    }
    

}

// MARK: - UITableViewDelegate, UITableViewDataSource
    // Delegados de la Table View
extension firstDateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return rowsToDisplay.count
        return conferenciaFamex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFrancia", for: indexPath) as! ConferenciasFranciaTableViewCell
        
        //cell.lblTitleConferencia.text = rowsToDisplay[indexPath.row]
        cell.lblTitleConferencia.text = conferenciaFamex[indexPath.row].title
        cell.lblTimeConferencia.text = conferenciaFamex[indexPath.row].publishedAt

        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        cell.btnAdd.tag = indexPath.row
        cell.btnInfo.tag = indexPath.row
        
        cell.btnAdd.addTarget(self, action: #selector(btnAddAction), for: .touchUpInside)
        cell.btnInfo.addTarget(self, action: #selector(btnInfoAction), for: .touchUpInside)
        
        return cell
    }
    
    
    @objc func btnAddAction (sender: UIButton) {
        
        let indexPathAux = IndexPath(row: sender.tag, section: 0)
        print("Se presiono el boton: \(indexPathAux)")
        
        print("Se desplega el popup")
        showPopUpAddMiItinerario().fadeInAndOut()
        /*
        let newEntryToItinerario = ITINERARIO(context: self.context)
        newEntryToItinerario.titleConferencia = rowsToDisplay[indexPathAux.row]
        
        self.itinerario.append(newEntryToItinerario)
        
        self.save()
        */
        
        // Prueba con la Api
        
        let newEntryToItinerario = ITINERARIO(context: self.context)
        newEntryToItinerario.titleConferencia = conferenciaFamex[indexPathAux.row].title
        
        self.itinerario.append(newEntryToItinerario)    // The append() method adds a new element at the end of the array.
        
        self.save()
        
        //
    }
    
    func save() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    @objc func btnInfoAction (sender: UIButton) {
        let indexPathAux = IndexPath(row: sender.tag, section: 0)
        
        
        
        let vc = storyboard?.instantiateViewController(identifier: "detailConferencia") as! detailConferenciaViewController
        vc.title = "Detalles"
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: vc)
        /*
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            vc.titleConferencia = pabellonA[indexPathAux.row]
        case 1:
            vc.titleConferencia = pabellonB[indexPathAux.row]
        case 2:
            vc.titleConferencia = pabellonC[indexPathAux.row]
        case 3:
            vc.titleConferencia = pabellonD[indexPathAux.row]
        case 4:
            vc.titleConferencia = pabellonE[indexPathAux.row]
        default:
            vc.titleConferencia = pabellonF[indexPathAux.row]
        }
        */
        
        // Prueba con la api de Noticias
        
        vc.titleConferencia = conferenciaFamex[indexPathAux.row].title
        vc.authorConferencia = conferenciaFamex[indexPathAux.row].author
        vc.descriptionConferencia = conferenciaFamex[indexPathAux.row].description
        vc.timeConferencia = conferenciaFamex[indexPathAux.row].publishedAt
        vc.placeConferencia = conferenciaFamex[indexPathAux.row].url
        
        //
        
        self.present(navBarOnModal, animated: true, completion: nil)
        
      
        
    }
 
    
    
}
