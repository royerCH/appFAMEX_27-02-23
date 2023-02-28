//
//  expoEstaticaFranciaViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 11/11/22.
//

import UIKit

class expoEstaticaFranciaViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var viewExpoEstaticaFrancia: UIView!
    @IBOutlet weak var viewBlockOne: UIView!
    @IBOutlet weak var viewBlockTwo: UIView!
    @IBOutlet weak var viewBlockThree: UIView!
    
    @IBOutlet weak var collectionViewExpoEstaticaFranciaBlock1: UICollectionView!
    @IBOutlet weak var collectionViewExpoEstaticaFranciaBlock2: UICollectionView!
    @IBOutlet weak var collectionViewExpoEstaticaFranciaBlock3: UICollectionView!
    
    
    @IBOutlet weak var scrollViewExpoEstaticaFrancia: UIScrollView!
    
    @IBOutlet weak var stackViewExpoEstaticaFrancia: UIStackView!
    
    @IBOutlet weak var imgBG: UIImageView!
    
    @IBOutlet weak var lblVisitarAeronaves: UILabel!
    @IBOutlet weak var lblExpoEstaticaFrancia: UILabel!
    @IBOutlet weak var lblBlock1: UILabel!
    @IBOutlet weak var lblBlock2: UILabel!
    @IBOutlet weak var lblBlock3: UILabel!
    
    // MARK: - Properties
    
    let arrayImgsBlock1 = ["avion1", "avion2","avion3"]
    let arrayImgsBlock2 = ["avion4", "avion5","avion6"]
    let arrayImgsBlock3 = ["avion7", "avion8","avion9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewExpoEstaticaFranciaBlock1.delegate = self
        collectionViewExpoEstaticaFranciaBlock1.dataSource = self
        collectionViewExpoEstaticaFranciaBlock2.delegate = self
        collectionViewExpoEstaticaFranciaBlock2.dataSource = self
        collectionViewExpoEstaticaFranciaBlock3.delegate = self
        collectionViewExpoEstaticaFranciaBlock3.dataSource = self
        
        collectionViewExpoEstaticaFranciaBlock1.register(UINib(nibName: "expoEstaticaFranciaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellExpoEstaticaFrancia")
        collectionViewExpoEstaticaFranciaBlock2.register(UINib(nibName: "expoEstaticaFranciaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellExpoEstaticaFrancia")
        collectionViewExpoEstaticaFranciaBlock3.register(UINib(nibName: "expoEstaticaFranciaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellExpoEstaticaFrancia")
        
        
        customViews()
    }
    
    // MARK: - Methods
    
    func customViews () {
        
            // views
        viewBlockOne.backgroundColor = .clear
        viewBlockTwo.backgroundColor = .clear
        viewBlockThree.backgroundColor = .clear
        
            // Collection Views
        collectionViewExpoEstaticaFranciaBlock1.backgroundColor = #colorLiteral(red: 0, green: 0.140528053, blue: 0.3108964264, alpha: 1).withAlphaComponent(0.5)
        collectionViewExpoEstaticaFranciaBlock2.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        collectionViewExpoEstaticaFranciaBlock3.backgroundColor = #colorLiteral(red: 0.6981756091, green: 0.05658373237, blue: 0.1276781261, alpha: 1).withAlphaComponent(0.5)
        
            // Labels
        lblVisitarAeronaves.text = "PARA VISITAR LAS AERONAVES EN LA FERIA CONSULTE SU UBICACION EN EL MAPA GENERAL"
        lblVisitarAeronaves.numberOfLines = 0
        lblVisitarAeronaves.adjustsFontSizeToFitWidth = true
        lblVisitarAeronaves.minimumScaleFactor = 0.5
        lblVisitarAeronaves.textAlignment = .center
        lblVisitarAeronaves.textColor = .white
        
        lblExpoEstaticaFrancia.text = "E\nX\nP\nO\nS\nI\nO\nN\n \nE\nS\nT\nA\nT\nI\nC\nA"
        lblExpoEstaticaFrancia.numberOfLines = 0
        lblExpoEstaticaFrancia.font = UIFont(name: "Arial", size: 40)
        lblExpoEstaticaFrancia.adjustsFontSizeToFitWidth = true
        lblExpoEstaticaFrancia.minimumScaleFactor = 0.5
        lblExpoEstaticaFrancia.textAlignment = .center
        lblExpoEstaticaFrancia.textColor = .white
        
        lblBlock1.text = "BLOQUE 1"
        lblBlock1.contentMode = .center
        lblBlock1.textColor = .white
        lblBlock1.backgroundColor = #colorLiteral(red: 0, green: 0.140528053, blue: 0.3108964264, alpha: 1)
        lblBlock1.font = .boldSystemFont(ofSize: 17)
        
        lblBlock2.text = "BLOQUE 2"
        lblBlock2.contentMode = .center
        lblBlock2.textColor = .black
        lblBlock2.backgroundColor = .white
        lblBlock2.font = .boldSystemFont(ofSize: 17)
        
        lblBlock3.text = "BLOQUE 3"
        lblBlock3.contentMode = .center
        lblBlock3.textColor = .white
        lblBlock3.backgroundColor = #colorLiteral(red: 0.6981756091, green: 0.05658373237, blue: 0.1276781261, alpha: 1)
        lblBlock3.font = .boldSystemFont(ofSize: 17)
    
        
    }


}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension expoEstaticaFranciaViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImgsBlock1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionViewExpoEstaticaFranciaBlock1 {
            let cellBlock1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellExpoEstaticaFrancia", for: indexPath) as? expoEstaticaFranciaCollectionViewCell
        
            cellBlock1?.lblNamePlane.text = arrayImgsBlock1[indexPath.row]
            cellBlock1?.lblNamePlane.backgroundColor = #colorLiteral(red: 0, green: 0.140528053, blue: 0.3108964264, alpha: 1)
            cellBlock1?.lblNamePlane.textColor = .white
            cellBlock1?.lblNamePlane.layer.borderWidth = 1
            cellBlock1?.lblNamePlane.layer.borderColor = UIColor.white.cgColor
            cellBlock1?.imgPlane.image = UIImage(named: arrayImgsBlock1[indexPath.row])
            
            
            
            return cellBlock1!
            
        } else if collectionView == self.collectionViewExpoEstaticaFranciaBlock2 {
            let cellBlock2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellExpoEstaticaFrancia", for: indexPath) as? expoEstaticaFranciaCollectionViewCell
            
            cellBlock2?.lblNamePlane.text = arrayImgsBlock2[indexPath.row]
            cellBlock2?.lblNamePlane.backgroundColor = .white
            cellBlock2?.lblNamePlane.textColor = .black
            cellBlock2?.lblNamePlane.layer.borderWidth = 1
            cellBlock2?.lblNamePlane.layer.borderColor = UIColor.black.cgColor
            cellBlock2?.imgPlane.image = UIImage(named: arrayImgsBlock2[indexPath.row])
            
            return cellBlock2!
            
        } else {
            let cellBlock3 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellExpoEstaticaFrancia", for: indexPath) as? expoEstaticaFranciaCollectionViewCell
            
            cellBlock3?.lblNamePlane.text = arrayImgsBlock3[indexPath.row]
            cellBlock3?.lblNamePlane.backgroundColor = #colorLiteral(red: 0.6981756091, green: 0.05658373237, blue: 0.1276781261, alpha: 1)
            cellBlock3?.lblNamePlane.textColor = .white
            cellBlock3?.lblNamePlane.layer.borderWidth = 1
            cellBlock3?.lblNamePlane.layer.borderColor = UIColor.white.cgColor
            cellBlock3?.imgPlane.image = UIImage(named: arrayImgsBlock3[indexPath.row])
            
            return cellBlock3!
            
        }
        
        
    }
    
    // Detectar click
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Se presiona la seccion: \(indexPath.section), Se presiono la celda: \(indexPath.row), valor de la celda: \(arrayImgsBlock1[indexPath.row])")
        
        let vc = storyboard?.instantiateViewController(identifier: "PopUpExpoEstatica") as! PopUpExpoEstaticaFranciaViewController
        vc.title = "Acerca"
        vc.imagenBarraPopUp = UIImage(named: "imgBarraRedPopUp")
        
        if collectionView == self.collectionViewExpoEstaticaFranciaBlock1 {
            
            collectionViewExpoEstaticaFranciaBlock1.deselectItem(at: indexPath, animated: true)
            vc.titlePopUp = arrayImgsBlock1[indexPath.row]
            vc.imagenPopUP = UIImage(named: arrayImgsBlock1[indexPath.row])
            
            let navBarOnModal: UINavigationController = UINavigationController(rootViewController: vc)
            self.present(navBarOnModal, animated: true, completion: nil)
            
        } else if collectionView == self.collectionViewExpoEstaticaFranciaBlock2 {
            
            collectionViewExpoEstaticaFranciaBlock2.deselectItem(at: indexPath, animated: true)
            vc.titlePopUp = arrayImgsBlock2[indexPath.row]
            vc.imagenPopUP = UIImage(named: arrayImgsBlock2[indexPath.row])
            
            let navBarOnModal: UINavigationController = UINavigationController(rootViewController: vc)
            self.present(navBarOnModal, animated: true, completion: nil)
            
        } else {
            
            collectionViewExpoEstaticaFranciaBlock3.deselectItem(at: indexPath, animated: true)
            vc.titlePopUp = arrayImgsBlock3[indexPath.row]
            vc.imagenPopUP = UIImage(named: arrayImgsBlock3[indexPath.row])
            
            let navBarOnModal: UINavigationController = UINavigationController(rootViewController: vc)
            self.present(navBarOnModal, animated: true, completion: nil)
            
        }
        
        
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension expoEstaticaFranciaViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.collectionViewExpoEstaticaFranciaBlock1 {
            
            return CGSize(width: collectionViewExpoEstaticaFranciaBlock1.frame.size.height, height: collectionViewExpoEstaticaFranciaBlock1.frame.size.height)
            
            
        } else if collectionView == self.collectionViewExpoEstaticaFranciaBlock2 {
            
            return CGSize(width: collectionViewExpoEstaticaFranciaBlock1.frame.size.height, height: collectionViewExpoEstaticaFranciaBlock1.frame.size.height)
            
        } else {
            
            return CGSize(width: collectionViewExpoEstaticaFranciaBlock1.frame.size.height, height: collectionViewExpoEstaticaFranciaBlock1.frame.size.height)
            
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1.0
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1.0
        
    }

}



