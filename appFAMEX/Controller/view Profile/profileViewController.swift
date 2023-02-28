//
//  profileViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 07/12/22.
//

import UIKit

class profileViewController: UIViewController {
    
    // MARK: - Outlets
        // Views
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var viewUsrName: UIView!
    @IBOutlet weak var viewLineRefNameUsr: UIView!
    
        // Images
    @IBOutlet weak var imgBGProfile: UIImageView!
    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var imgIconUser: UIImageView!
    
        // Collection view
    @IBOutlet weak var collectionViewProfile: UICollectionView!
    
        // Text Field
    @IBOutlet weak var usrNameTxtField: UITextField!
    
    // MARK: - Properties
    private let cellSizeWitdh = UIScreen.main.bounds.width / 5
    var UsrName: String?
    let arrayImagesUser: [String] = ["imgProfile1", "imgProfile2", "imgProfile3", "imgProfile4", "imgProfile5"]
    
    // MARK: - View Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Delegado del textfiel
        self.usrNameTxtField.delegate = self
        
        // Delegados del collection view
        collectionViewProfile.delegate = self
        collectionViewProfile.dataSource = self
        collectionViewProfile.register(UINib(nibName: "ImagesProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellImagesUser")
        
        customViews()
    }
    
    // MARK: - Methods
    func customViews() {

        // views
        viewUsrName.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        viewUsrName.layer.cornerRadius = 10
        viewLineRefNameUsr.backgroundColor = .white
        
        // Textfield
        usrNameTxtField.backgroundColor = .clear
        usrNameTxtField.textColor = .white
        usrNameTxtField.placeholder = "Usuario"
        usrNameTxtField.font = UIFont(name: "Arial", size: 25)
        
        
        // Collection view
        collectionViewProfile.backgroundColor = .clear
        
    }

}

// MARK: - UITextFieldDelegate
extension profileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usrNameTxtField.resignFirstResponder()
        return true
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension profileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Number of items Collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImagesUser.count
    }
    
    // Populate Collecttion view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellImagesUser", for: indexPath) as? ImagesProfileCollectionViewCell
        
        let images = UIImage(named: arrayImagesUser[indexPath.row])
        let bgColorView = UIView()
        
        bgColorView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        cell?.selectedBackgroundView = bgColorView
        
        cell?.imgUsr.image = images
        cell?.backgroundColor = .clear
        cell?.layer.cornerRadius = 20
        return cell!
        
    }
    
    // Action on Tap Collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        imgUserProfile.image = UIImage(named: arrayImagesUser[indexPath.row])
        
    }

    // Animation Collection View
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.transform = CGAffineTransform(translationX: 0, y: cellSizeWitdh)
        cell.alpha = 0

                UIView.animate(
                    withDuration: 1,
                    delay: 0.3 * Double(indexPath.row),
                    usingSpringWithDamping: 0.8,
                    initialSpringVelocity: 0.1,
                    options: [.curveEaseInOut],
                    animations: {

                        cell.alpha = 1
                        cell.transform = CGAffineTransform(translationX: 0, y: 0)

                    })
    }
    
    // Animation Bounce
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
    }

    // Animation Bounce
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.transform = .identity
        }
    }
  
    // Size items Collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSizeWitdh, height: cellSizeWitdh)
    }
    
}
