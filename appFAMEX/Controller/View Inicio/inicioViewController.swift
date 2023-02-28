//
//  inicioViewController.swift
//  appFAMEX
//
//  Created by user223114 on 9/6/22.
//

import UIKit
import iCarousel

class inicioViewController: UIViewController, protocoloMenu {
    
    //-----------------------Outlets-----------------------
    
        // Views
    @IBOutlet weak var viewInicio: UIView!
    @IBOutlet weak var viewCarousel: UIView!
    @IBOutlet weak var viewCarouselBanners: UIView!
    @IBOutlet weak var viewButtons: UIView!
    @IBOutlet weak var viewLineRefButtons: UIView!
    
    
    //@IBOutlet weak var viewCarousel: iCarousel!
    
        
        // Images
    @IBOutlet weak var imgInicioFondo: UIImageView!
    
        // Buttons
    @IBOutlet weak var btnEventos: UIButton!
    @IBOutlet weak var btnMiItinerario: UIButton!
    
        // Labels
    @IBOutlet weak var lblPatrocinadores: UILabel!
    @IBOutlet weak var lblEventos: UILabel!
    @IBOutlet weak var lblMiItinerario: UILabel!
    
    
        // Page Controls
    @IBOutlet weak var pageControlCarousel: UIPageControl!
    
        // Swipe Gesture View
    @IBOutlet weak var swipeGestureView: UISwipeGestureRecognizer!
    
      
    
    
    //-----------------------Properties-----------------------
    
   public var menu:Bool = false                       // Bandera menu en falso, es decir, no se depliega el menu
    var viewOptionSelect = CGAffineTransform()
    
    // Carrusel Inicio
    let myCarouselInicio: iCarousel = {                    // Nombre del carrusel
        let carousel = iCarousel()                   // Se crea la instancia de tipo Icarousel (Se crea el objeto carrusel)
        carousel.type = iCarouselType.rotary         // Tipo de carrusel
        return carousel
    }()
    
    // Carrusel Banners
    let myCarouselBanners: iCarousel = {
        let carousel = iCarousel()
        carousel.type = iCarouselType.linear
        return carousel
    }()
    
    let imagesCarouselInicio = ["imgCarousel1", "imgCarousel2", "imgCarousel3", "imgCarousel4", "imgCarousel5"]   // Imagenes del Carrusel
    
    let imagesCarouselBanners = ["imgCarouselBanner1", "imgCarouselBanner2","imgCarouselBanner3"] // Imagenes del carrusel de los patrocinadores
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.0307629546, green: 0.1608202691, blue: 0.325432595, alpha: 1)
        
        
        viewCarousel.addSubview(myCarouselInicio)     // Colocar myCarousel en la vista "viewCarousel"
        viewCarousel.backgroundColor = .clear   // Color de fondo de "viewCarousel" en transparente
        customMyCarouselInicio()
        
        viewCarouselBanners.addSubview(myCarouselBanners)
        viewCarouselBanners.backgroundColor = .clear
        viewButtons.backgroundColor = .clear
        viewLineRefButtons.backgroundColor = .clear
        customMyCarouselBanners()
        
        // Protcolos del carrusel
        myCarouselInicio.dataSource = self
        myCarouselInicio.delegate = self
        myCarouselBanners.dataSource = self
        myCarouselBanners.dataSource = self
        
        // Animacion y personalizacion del Menu
        viewOptionSelect = viewInicio.transform
        customNavigationBar()
        addchildController()
        
        customLabelsAndButtons()
        
        pageControlCarousel.numberOfPages = imagesCarouselInicio.count
        pageControlCarousel.currentPageIndicatorTintColor = .white
        
        
       
    }
    

    
    //-----------------------Methods-----------------------
    
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
    
        // Metodo para personalizar el Navigation bar
    func customNavigationBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07122091204, green: 0.05044277757, blue: 0.1986504793, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "INICIO"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "imgBtnHamburguesa")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(btnMenuHamburguesa))
    }
    
        // Metodo para personalizar el carrusel Inicio
    func customMyCarouselInicio() {
        
        myCarouselInicio.frame = CGRect(x: 0, y: 0, width: viewCarousel.frame.size.width, height:viewCarousel.frame.size.height)  // Medidas de pantalla del carrusel
        
        // myCarouselInicio.frame = viewCarousel.bounds
        
        var activeItemIndex = 0
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in   // Funcion autoscroll
            activeItemIndex += 1
            if activeItemIndex == self.myCarouselInicio.numberOfItems {
                activeItemIndex = 0
            }
            self.myCarouselInicio.scrollToItem(at: activeItemIndex, duration: 3)
        }
        
    }
        // Metodo para personalizar el carrusel Banners
    func customMyCarouselBanners() {
        
        myCarouselBanners.frame = CGRect(x: 0, y: 0, width: viewCarouselBanners.frame.size.width, height:viewCarouselBanners.frame.size.height)  // Medidas de pantalla del carrusel
        
        var activeItemIndex = 0
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in   // Funcion autoscroll
            activeItemIndex += 1
            if activeItemIndex == self.myCarouselBanners.numberOfItems {
                activeItemIndex = 0
            }
            self.myCarouselBanners.scrollToItem(at: activeItemIndex, duration: 3)
        }
        
    }
        // Metodo para personalizar botones y labels
    func customLabelsAndButtons() {
            // LABELS
                // Label Patrocinadores
        lblPatrocinadores.text = "Powered by:"
        lblPatrocinadores.font = UIFont(name: "Impact", size: 15)
        lblPatrocinadores.adjustsFontSizeToFitWidth = true
        lblPatrocinadores.minimumScaleFactor = 0.5
        lblPatrocinadores.textColor = .white
        
                // Label del Boton Evento
        lblEventos.text = "EVENTO"
        lblEventos.font = UIFont(name: "Plateia", size: 15)
        lblEventos.adjustsFontSizeToFitWidth = true
        lblEventos.minimumScaleFactor = 0.5
        lblEventos.textAlignment = .center
        lblEventos.textColor = .white
        
                // Label del Boton Evento
        lblMiItinerario.text = "MI ITINERARIO"
        lblMiItinerario.font = UIFont(name: "Plateia", size: 15)
        lblMiItinerario.adjustsFontSizeToFitWidth = true
        lblEventos.minimumScaleFactor = 0.5
        lblMiItinerario.textAlignment = .center
        lblMiItinerario.textColor = .white
        
            // BOTONES
                // Boton eventos
        btnEventos.backgroundColor = .clear
        btnEventos.setTitleColor(.clear, for: .normal)
        
                // Boton Mi Itinerario
        btnMiItinerario.backgroundColor = .clear
        btnMiItinerario.setTitleColor(.clear, for: .normal)
    }
    
    
    // Actions
    
        // Accion del boton Hamburguesa
    @objc func btnMenuHamburguesa () {
        if menu == false {
            viewInicio.showMenu()
            menu = true
        }else if menu == true {
            viewInicio.hideMenu(viewOptionSelect: viewOptionSelect)
            menu = false
        }
    }
    
        // Accion para el page Control *AUN SIN FUNCIONAMIENTO
    @IBAction func pageControlActionCarousel(_ sender: Any) {
        
    }
        // Accion para el boton Evento *AUN SIN FUNCIONAMIENTO
    @IBAction func btnActionEvento(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name:"Main", bundle: nil)
        if let conVC = storyBoard.instantiateViewController(withIdentifier: "Evento") as? eventosViewController,
           let navController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController as? UINavigationController {
            
            navController.pushViewController(conVC, animated: true)
        }
    }
    
    @IBAction func btnActionMiItinerario(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name:"Main", bundle: nil)
        if let conVC = storyBoard.instantiateViewController(withIdentifier: "Itinerario") as? itinerarioViewController,
           let navController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController as? UINavigationController {
            
            navController.pushViewController(conVC, animated: true)
        }
    }
    
}

    // Delegado del iCarousel
extension inicioViewController: iCarouselDelegate, iCarouselDataSource{

        // Metodo que retorna el numero total de items del carrusel (numero de imagenes del carrusel)
    func numberOfItems(in carousel: iCarousel) -> Int {
        var imageNumbersReturn:Int?
        if carousel == self.myCarouselInicio {          // Carrusel Inicio
            let imageNumbers = imagesCarouselInicio.count
            imageNumbersReturn = imageNumbers
        }
        if carousel == self.myCarouselBanners {         // Carrusel Banners
            let imageNumbers = imagesCarouselBanners.count
            imageNumbersReturn = imageNumbers
        }
        return imageNumbersReturn!   // Numero de imagenes del carousel
    }
    
        // Metodo que retorna las vistas del carrusell. * Llena el carrusel con imagenes
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var viewsReturn = UIView()
        
        if carousel == self.myCarouselInicio {          // Carrusel Inicio
            let view = UIView(frame: CGRect(x: 0, y: 0, width: viewCarousel.frame.size.width/5, height: viewCarousel.frame.size.height))
            
            
            view.backgroundColor = .clear
            
            let imgPackCarousel = UIImageView(frame: view.bounds)
            view.addSubview(imgPackCarousel)
            imgPackCarousel.contentMode = .scaleAspectFill
            imgPackCarousel.image = UIImage(named: imagesCarouselInicio[index])
            
            viewsReturn = view
        }
        if carousel == self.myCarouselBanners {         // Carrusel Banners
            let view = UIView(frame: CGRect(x: 0, y: 0, width: viewCarouselBanners.frame.size.width, height: viewCarouselBanners.frame.size.height))
            view.backgroundColor = .clear
            let imgPackCarouselBanners = UIImageView(frame: view.bounds)
            view.addSubview(imgPackCarouselBanners)
            imgPackCarouselBanners.contentMode = .scaleAspectFill
            imgPackCarouselBanners.image = UIImage(named: imagesCarouselBanners[index])
            
            viewsReturn = view
        }
        
        return viewsReturn
    }
    
        // Metodo que indica que item (imagen) presiono el usuario
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        pageControlCarousel.currentPage = index
        pageControlCarousel.currentPage = carousel.currentItemIndex
        print("Se presiono el primero: \(index)")
        print("Se presiono el segundo: \(carousel.currentItemIndex)")
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        switch option {
        case .wrap:
            print(option)
            return 1
        default:
            return value
        }
    }
}
