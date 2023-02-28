//
//  hotelsViewController.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 09/12/22.
//

import UIKit
import iCarousel

class hotelsViewController: UIViewController {
    
    // MARK: - Outlets
        // Views
    @IBOutlet weak var viewHotels: UIView!
    
        // Images
    @IBOutlet weak var imgGBHotels: UIImageView!
    @IBOutlet weak var imgLogoFamex: UIImageView!
    
        // Labels
    @IBOutlet weak var lblSpecialRate: UILabel!
    @IBOutlet weak var lblHotels: UILabel!
    
        // Collection View
    @IBOutlet weak var collectionViewHotelsFamex: UICollectionView!
    
        // Page Control
    @IBOutlet weak var pageControlHotelsFamex: UIPageControl!
    
    @IBOutlet weak var myCarousel: iCarousel!
    
    /*
    let myCarouselHotels: iCarousel = {                    // Nombre del carrusel
        let carousel = iCarousel()                   // Se crea la instancia de tipo Icarousel (Se crea el objeto carrusel)
        carousel.type = iCarouselType.rotary         // Tipo de carrusel
        return carousel
    }()
    */
    // MARK: - View Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControlHotelsFamex.numberOfPages = 5
        pageControlHotelsFamex.currentPage = myCarousel.currentItemIndex
        
        myCarousel.type = .linear
        myCarousel.backgroundColor = .clear
        myCarousel.delegate = self
        myCarousel.dataSource = self
        
        collectionViewHotelsFamex.isHidden = true
        collectionViewHotelsFamex.backgroundColor = .clear
        collectionViewHotelsFamex.delegate = self
        collectionViewHotelsFamex.dataSource = self
        collectionViewHotelsFamex.register(UINib(nibName: "HotelsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "hotelsCell")
        
        customLbls()
 
    }
    
    func customLbls() {
        lblHotels.text = "HOTELES"
        lblHotels.font = UIFont(name: "Arial", size: 40)
        lblHotels.adjustsFontSizeToFitWidth = true
        lblHotels.minimumScaleFactor = 0.5
        lblHotels.textAlignment = .center
        lblHotels.textColor = .white
    }
    
    @IBAction func pageControlActionHotels(_ sender: Any) {
        
        myCarousel.scrollToItem(at: pageControlHotelsFamex.currentPage, animated: true)
        
    }
    
    

}

extension hotelsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionViewHotelsFamex.dequeueReusableCell(withReuseIdentifier: "hotelsCell", for: indexPath) as? HotelsCollectionViewCell
        
        
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionViewHotelsFamex.frame.width - 20, height: collectionViewHotelsFamex.frame.height)
        
    }
    
}

extension hotelsViewController: iCarouselDelegate, iCarouselDataSource{
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hotelsCell", for: index) as? HotelsCollectionViewCell
        
        let indexAux = NSIndexPath(row: index, section: 0)
        
        let cell = collectionViewHotelsFamex.dequeueReusableCell(withReuseIdentifier: "hotelsCell", for: indexAux as IndexPath) as? HotelsCollectionViewCell
        
    
        
        return cell!
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        switch option {
        case .spacing:
            return 1.1
        default:
            return value
        }
    }
    
}


