//
//  expoEstaticaMexicoViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 23/11/22.
//

import UIKit

class expoEstaticaMexicoViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var viewExpoEstaticaMexico: UIView!
    @IBOutlet weak var viewBlockOneMex: UIView!
    @IBOutlet weak var viewBlockTwoMex: UIView!
    @IBOutlet weak var viewBlockThreeMex: UIView!
    
    @IBOutlet weak var collectionViewExpoEstaticaMexBlock1: UICollectionView!
    @IBOutlet weak var collectionViewExpoEstaticaMexBlock2: UICollectionView!
    @IBOutlet weak var collectionViewExpoEstaticaMexBlock3: UICollectionView!
    
    
    @IBOutlet weak var scrollViewExpoEstaticaMex: UIScrollView!
    
    @IBOutlet weak var stackViewExpoEstaticaMex: UIStackView!
    
    @IBOutlet weak var imgBG: UIImageView!
    
    @IBOutlet weak var lblVisitarAeronavesMex: UILabel!
    @IBOutlet weak var lblExpoEstaticaMex: UILabel!
    @IBOutlet weak var lblBlock1Mex: UILabel!
    @IBOutlet weak var lblBlock2Mex: UILabel!
    @IBOutlet weak var lblBlock3Mex: UILabel!
    
    // MARK: - Properties
    
    let arrayImgsBlock1Mex = ["avion1", "avion2","avion3"]
    let arrayImgsBlock2Mex = ["avion4", "avion5","avion6"]
    let arrayImgsBlock3Mex = ["avion7", "avion8","avion9"]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewExpoEstaticaMexBlock1.delegate = self
        collectionViewExpoEstaticaMexBlock1.dataSource = self
        collectionViewExpoEstaticaMexBlock2.delegate = self
        collectionViewExpoEstaticaMexBlock2.dataSource = self
        collectionViewExpoEstaticaMexBlock3.delegate = self
        collectionViewExpoEstaticaMexBlock3.dataSource = self
        
        collectionViewExpoEstaticaMexBlock1.register(UINib(nibName: "expoEstaticaFranciaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellExpoEstaticaFrancia")
        collectionViewExpoEstaticaMexBlock2.register(UINib(nibName: "expoEstaticaFranciaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellExpoEstaticaFrancia")
        collectionViewExpoEstaticaMexBlock3.register(UINib(nibName: "expoEstaticaFranciaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellExpoEstaticaFrancia")
        
        
        customViews()
       
    }
    
    // MARK: - Methods
    
    func customViews () {
        
            // views
        viewBlockOneMex.backgroundColor = .clear
        viewBlockTwoMex.backgroundColor = .clear
        viewBlockThreeMex.backgroundColor = .clear
        
            // Collection Views
        collectionViewExpoEstaticaMexBlock1.backgroundColor = #colorLiteral(red: 0.00243325741, green: 0.3789288104, blue: 0.2599503994, alpha: 1).withAlphaComponent(0.5)
        collectionViewExpoEstaticaMexBlock2.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        collectionViewExpoEstaticaMexBlock3.backgroundColor = #colorLiteral(red: 0.7615993023, green: 0.0621605888, blue: 0.1412988901, alpha: 1).withAlphaComponent(0.5)
        
            // Labels
        lblVisitarAeronavesMex.text = "PARA VISITAR LAS AERONAVES EN LA FERIA CONSULTE SU UBICACION EN EL MAPA GENERAL"
        lblVisitarAeronavesMex.numberOfLines = 0
        lblVisitarAeronavesMex.adjustsFontSizeToFitWidth = true
        lblVisitarAeronavesMex.minimumScaleFactor = 0.5
        lblVisitarAeronavesMex.textAlignment = .center
        lblVisitarAeronavesMex.textColor = .white
        
        lblExpoEstaticaMex.text = "E\nX\nP\nO\nS\nI\nO\nN\n \nE\nS\nT\nA\nT\nI\nC\nA"
        lblExpoEstaticaMex.numberOfLines = 0
        lblExpoEstaticaMex.font = UIFont(name: "Arial", size: 40)
        lblExpoEstaticaMex.adjustsFontSizeToFitWidth = true
        lblExpoEstaticaMex.minimumScaleFactor = 0.5
        lblExpoEstaticaMex.textAlignment = .center
        lblExpoEstaticaMex.textColor = .white
        
        lblBlock1Mex.text = "BLOQUE 1"
        lblBlock1Mex.contentMode = .center
        lblBlock1Mex.textColor = .white
        lblBlock1Mex.backgroundColor = #colorLiteral(red: 0.00243325741, green: 0.3789288104, blue: 0.2599503994, alpha: 1)
        lblBlock1Mex.font = .boldSystemFont(ofSize: 17)
        
        lblBlock2Mex.text = "BLOQUE 2"
        lblBlock2Mex.contentMode = .center
        lblBlock2Mex.textColor = .black
        lblBlock2Mex.backgroundColor = .white
        lblBlock2Mex.font = .boldSystemFont(ofSize: 17)
        
        lblBlock3Mex.text = "BLOQUE 3"
        lblBlock3Mex.contentMode = .center
        lblBlock3Mex.textColor = .white
        lblBlock3Mex.backgroundColor = #colorLiteral(red: 0.7615993023, green: 0.0621605888, blue: 0.1412988901, alpha: 1)
        lblBlock3Mex.font = .boldSystemFont(ofSize: 17)
    
        
    }

}

    // MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension expoEstaticaMexicoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImgsBlock1Mex.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionViewExpoEstaticaMexBlock1 {
            let cellBlock1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellExpoEstaticaFrancia", for: indexPath) as? expoEstaticaFranciaCollectionViewCell
        
            cellBlock1?.lblNamePlane.text = arrayImgsBlock1Mex[indexPath.row]
            cellBlock1?.lblNamePlane.backgroundColor = #colorLiteral(red: 0.00243325741, green: 0.3789288104, blue: 0.2599503994, alpha: 1)
            cellBlock1?.lblNamePlane.textColor = .white
            cellBlock1?.lblNamePlane.layer.borderWidth = 1
            cellBlock1?.lblNamePlane.layer.borderColor = UIColor.white.cgColor
            cellBlock1?.imgPlane.image = UIImage(named: arrayImgsBlock1Mex[indexPath.row])
            
            
            
            return cellBlock1!
            
        } else if collectionView == self.collectionViewExpoEstaticaMexBlock2 {
            let cellBlock2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellExpoEstaticaFrancia", for: indexPath) as? expoEstaticaFranciaCollectionViewCell
            
            cellBlock2?.lblNamePlane.text = arrayImgsBlock2Mex[indexPath.row]
            cellBlock2?.lblNamePlane.backgroundColor = .white
            cellBlock2?.lblNamePlane.textColor = .black
            cellBlock2?.lblNamePlane.layer.borderWidth = 1
            cellBlock2?.lblNamePlane.layer.borderColor = UIColor.black.cgColor
            cellBlock2?.imgPlane.image = UIImage(named: arrayImgsBlock2Mex[indexPath.row])
            
            return cellBlock2!
            
        } else {
            let cellBlock3 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellExpoEstaticaFrancia", for: indexPath) as? expoEstaticaFranciaCollectionViewCell
            
            cellBlock3?.lblNamePlane.text = arrayImgsBlock3Mex[indexPath.row]
            cellBlock3?.lblNamePlane.backgroundColor = #colorLiteral(red: 0.7615993023, green: 0.0621605888, blue: 0.1412988901, alpha: 1)
            cellBlock3?.lblNamePlane.textColor = .white
            cellBlock3?.lblNamePlane.layer.borderWidth = 1
            cellBlock3?.lblNamePlane.layer.borderColor = UIColor.white.cgColor
            cellBlock3?.imgPlane.image = UIImage(named: arrayImgsBlock3Mex[indexPath.row])
            
            return cellBlock3!
            
        }
    }
    
    // Detectar click
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Se presiona la seccion: \(indexPath.section), Se presiono la celda: \(indexPath.row), valor de la celda: \(arrayImgsBlock1Mex[indexPath.row])")
        
        let vc = storyboard?.instantiateViewController(identifier: "PopUpExpoEstatica") as! PopUpExpoEstaticaFranciaViewController
        vc.title = "Acerca"
        vc.imagenBarraPopUp = UIImage(named: "imgBarraBluePopUp")
        
        if collectionView == self.collectionViewExpoEstaticaMexBlock1 {
            
            collectionViewExpoEstaticaMexBlock1.deselectItem(at: indexPath, animated: true)
            vc.titlePopUp = arrayImgsBlock1Mex[indexPath.row]
            vc.imagenPopUP = UIImage(named: arrayImgsBlock1Mex[indexPath.row])
            
            let navBarOnModal: UINavigationController = UINavigationController(rootViewController: vc)
            self.present(navBarOnModal, animated: true, completion: nil)
            
        } else if collectionView == self.collectionViewExpoEstaticaMexBlock2 {
            
            collectionViewExpoEstaticaMexBlock2.deselectItem(at: indexPath, animated: true)
            vc.titlePopUp = arrayImgsBlock2Mex[indexPath.row]
            vc.imagenPopUP = UIImage(named: arrayImgsBlock2Mex[indexPath.row])
            
            let navBarOnModal: UINavigationController = UINavigationController(rootViewController: vc)
            self.present(navBarOnModal, animated: true, completion: nil)
            
        } else {
            
            collectionViewExpoEstaticaMexBlock3.deselectItem(at: indexPath, animated: true)
            vc.titlePopUp = arrayImgsBlock3Mex[indexPath.row]
            vc.imagenPopUP = UIImage(named: arrayImgsBlock3Mex[indexPath.row])
            
            let navBarOnModal: UINavigationController = UINavigationController(rootViewController: vc)
            self.present(navBarOnModal, animated: true, completion: nil)
            
        }
        
        
    }
    
    
}

    // MARK: - UICollectionViewDelegateFlowLayout

extension expoEstaticaMexicoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.collectionViewExpoEstaticaMexBlock1 {
            
            return CGSize(width: collectionViewExpoEstaticaMexBlock1.frame.size.height, height: collectionViewExpoEstaticaMexBlock1.frame.size.height)
            
            
        } else if collectionView == self.collectionViewExpoEstaticaMexBlock2 {
            
            return CGSize(width: collectionViewExpoEstaticaMexBlock2.frame.size.height, height: collectionViewExpoEstaticaMexBlock2.frame.size.height)
            
        } else {
            
            return CGSize(width: collectionViewExpoEstaticaMexBlock3.frame.size.height, height: collectionViewExpoEstaticaMexBlock3.frame.size.height)
            
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1.0
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1.0
        
    }
}
