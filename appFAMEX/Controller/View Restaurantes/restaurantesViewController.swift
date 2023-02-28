//
//  restaurantesViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 08/09/22.
//

import UIKit

class restaurantesViewController: UIViewController, protocoloMenu {
    
    // Views
    @IBOutlet weak var viewRestaurantes: UIView!
    
    // CollectionViews
    @IBOutlet weak var collectViewRestaurantes: UICollectionView!
    
    // Images
    @IBOutlet weak var imgBGRestaurantes: UIImageView!
    
    var menu: Bool = false
    var viewOptionSelect: CGAffineTransform = CGAffineTransform()
    
    struct structRestaurantes {             // Campos de la opcion del restarante
        var title = String()    // Nombre del restaurante
        var image = String()    // Nombre de cada imagen
    }
    
    // Opciones de Restaurantes
    var optionsRestaurantes: [structRestaurantes] = [
        structRestaurantes(title: "McDonald's", image: "imgMcdonalds"),
        structRestaurantes(title: "Sushi Itto", image: "imgSushiItto"),
        structRestaurantes(title: "Ling Ling", image: "imgLingLing"),
        structRestaurantes(title: "Porfirio's Masaryk", image: "imgPorfiriosMasaryk"),
        structRestaurantes(title: "Italianni's", image: "imgItaliannis")
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.0307629546, green: 0.1608202691, blue: 0.325432595, alpha: 1)
        
        // Delegados del Collection View
        collectViewRestaurantes.dataSource = self
        collectViewRestaurantes.register(UINib(nibName: "CustomCollectionViewCellRestaurantes", bundle: nil), forCellWithReuseIdentifier: "cellRestaurante")
        
        viewOptionSelect = viewRestaurantes.transform
        customNavigationBar()
        customCollectionView()
        addchildController()
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
        
        navigationItem.title = "RESTAURANTES"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "imgBtnHamburguesa")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(btnMenuHamburguesa))
    }
    
    @objc func btnMenuHamburguesa() {
        if menu == false {
            viewRestaurantes.showMenu()
            menu = true
        }else if menu == true {
            viewRestaurantes.hideMenu(viewOptionSelect: viewOptionSelect)
            menu = false
        }
    }
    
    func customCollectionView() {
        collectViewRestaurantes.backgroundColor = .clear
    }

}

// MARK: - UICollectionViewDataSource
extension restaurantesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return optionsRestaurantes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellRestaurante", for: indexPath) as? CustomCollectionViewCellRestaurantes
        
        cell?.lblNombreRestaurante.text = optionsRestaurantes[indexPath.row].title
        
        
        return cell!
    }
    
    
}
