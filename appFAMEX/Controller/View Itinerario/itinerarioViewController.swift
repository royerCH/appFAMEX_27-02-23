//
//  itinerarioViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 08/09/22.
//

import UIKit
import CoreData

class itinerarioViewController: UIViewController, protocoloMenu {
    
    @IBOutlet weak var viewItinerario: UIView!
    @IBOutlet weak var viewImgProfile: UIView!
    @IBOutlet weak var viewShare: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imgBGItinerio: UIImageView!
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var btnShareItinerario: UIButton!
    
    @IBOutlet weak var segmentedControlDays: UISegmentedControl!
    
    @IBOutlet weak var tableViewMiItinerario: UITableView!
    
    
    var itinerarioList = [ITINERARIO]() // Arreglo de objetos de la base de datos local (Entidad ITINERARIO)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext   // Referencia a la base de datos
    
    var menu: Bool = false
    
    var viewOptionSelect: CGAffineTransform = CGAffineTransform()
    
    let segmentedControlValues = ["Dia 26", "Dia 27", "Dia 28"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.0307629546, green: 0.1608202691, blue: 0.325432595, alpha: 1)

        viewOptionSelect = viewItinerario.transform
        customNavigationBar()
        addchildController()
        customViews()
        
        tableViewMiItinerario.delegate = self
        tableViewMiItinerario.dataSource = self
        
        tableViewMiItinerario.register(UINib(nibName: "TableViewCellMiItinerario", bundle: nil), forCellReuseIdentifier: "cellMiItinerario")
        
        readTask()
        
    }
    
    private func addchildController() {
        
        let menuViewController = storyboard!.instantiateViewController(withIdentifier: "Menu")
        self.addChild(menuViewController)
        menuViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuViewController.view)
        NSLayoutConstraint.activate([
                                        menuViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),   // Constraint Izquierdo
                                        menuViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),   // Constraint derecho
                                        menuViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),          // Constraint superior
                                        menuViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)])    // Constraint inferior
        menuViewController.didMove(toParent: self)
        self.view.sendSubviewToBack(menuViewController.view)
        
    }
    
    func customNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "ITINERARIO"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "imgBtnHamburguesa")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(btnMenuHamburguesa))
    }
    
    func customViews() {
        
        // Views
        viewImgProfile.backgroundColor = .clear
        
        // Botones
        btnShareItinerario.setTitle("    Compartir Itinerario", for: .normal)
        
        // Segmented Control
        segmentedControlDays.removeAllSegments()
        for (index, value) in segmentedControlValues.enumerated() {
            segmentedControlDays.insertSegment(withTitle: value, at: index, animated: true)
        }
        segmentedControlDays.selectedSegmentIndex = 0
        
        
    }
    
    func save() {       // Funcion para salvar la informacion en la BD local
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableViewMiItinerario.reloadData()
    }
    
    func readTask() {
        let request: NSFetchRequest<ITINERARIO> = ITINERARIO.fetchRequest()
        
        do {
            itinerarioList = try context.fetch(request)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func btnMenuHamburguesa() {
        if menu == false {
            viewItinerario.showMenu()
            menu = true
        }else if menu == true {
            viewItinerario.hideMenu(viewOptionSelect: viewOptionSelect)
            menu = false
        }
    }
    
    @IBAction func segmentedControlDaysAction(_ sender: Any) {
        
    }
    
    @IBAction func btnActionShareItinerario(_ sender: Any) {
   
        let pdfFilePath = self.tableViewMiItinerario.exportAsPdfFromTable()
        print("Se implimio correctamente el Doc PDF \(pdfFilePath)")
        
        
        
    }
    

}

extension itinerarioViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itinerarioList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMiItinerario", for: indexPath) as! TableViewCellMiItinerario
        
        let itinerario = itinerarioList[indexPath.row]
        
        cell.lblTitleConferenciaMiItinerario.text = itinerario.titleConferencia
        cell.lblDateConferenciaMiItinerario.text = itinerario.dateConferencia
        
        cell.btnTrash.tag = indexPath.row
        cell.btnInfo.tag = indexPath.row
        
        cell.btnTrash.addTarget(self, action: #selector(btnTrashAction), for: .touchUpInside)
        cell.btnInfo.addTarget(self, action: #selector(btnInfoAction), for: .touchUpInside)
        
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { _, _, _ in self.context.delete(self.itinerarioList[indexPath.row])
            self.itinerarioList.remove(at: indexPath.row)
            self.save()
        }
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    @objc func btnTrashAction (sender: UIButton) {
        let indexPathAux = IndexPath(row: sender.tag, section: 0)
        print("Se borro la celda: \(indexPathAux)")
        
        
    }
    
    @objc func btnInfoAction (sender: UIButton) {
  
        //let indexPathAux = itinerarioList[IndexPath(row: sender.tag, section: 0)]
       
        
        let vc = storyboard?.instantiateViewController(identifier: "detailConferencia") as! detailConferenciaViewController
        vc.title = "Detalles"
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: vc)
        
        vc.titleConferencia = "Hola"
        
        
        self.present(navBarOnModal, animated: true, completion: nil)
        
      
        
    }
    
}

