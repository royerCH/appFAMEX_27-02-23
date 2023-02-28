//
//  FontFAMEX.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 09/01/23.
//

import Foundation
import UIKit


class FAMEXText {
    
        // Metodos
    func HandlingText(Label: UILabel, Title: String, Font: String, Size: CGFloat, TextColor: UIColor, LineBreak: Bool, TextAlignment: NSTextAlignment) {
        
        if LineBreak == true {
            Label.text = Title
            Label.font = UIFont(name: Font, size: Size)
            Label.numberOfLines = 0
            Label.adjustsFontSizeToFitWidth = true
            Label.minimumScaleFactor = 0.5
            Label.textAlignment = TextAlignment
            Label.textColor = TextColor
        } else {
            Label.text = Title
            Label.font = UIFont(name: Font, size: Size)
            Label.adjustsFontSizeToFitWidth = true
            Label.minimumScaleFactor = 0.5
            Label.textAlignment = TextAlignment
            Label.textColor = TextColor
        }

    }
    
}

class FAMEXText2 {
    
        // Propiedades
    
    var Label: UILabel                      // Label
    var Title: String                       // Titulo del label
    var Font: String                        // Fuente
    var Size: CGFloat                       // Tamaño del texto
    var TextColor: UIColor                  // Color del text
    var LineBreak: Bool                     // Salto de linea
    var TextAlignment: NSTextAlignment      // Alineacion del texto
        
        // Inicializador (Para crear objeto)
    
    init(Label: UILabel, Title: String, Font: String, Size: CGFloat, TextColor: UIColor, LineBreak: Bool, TextAlignment: NSTextAlignment) {
        self.Label = Label
        self.Title = Title
        self.Font = Font
        self.Size = Size
        self.TextColor = TextColor
        self.LineBreak = LineBreak
        self.TextAlignment = TextAlignment
    }
    
        // Metodos
    
    func HandlingText2() {
        
        if LineBreak == true {

            Label.text = Title
            Label.font = UIFont(name: Font, size: Size)
            Label.numberOfLines = 0
            Label.adjustsFontSizeToFitWidth = true
            Label.minimumScaleFactor = 0.5
            Label.textAlignment = TextAlignment
            Label.textColor = TextColor
            
        } else {

            Label.text = Title
            Label.font = UIFont(name: Font, size: Size)
            Label.adjustsFontSizeToFitWidth = true
            Label.minimumScaleFactor = 0.5
            Label.textAlignment = TextAlignment
            Label.textColor = TextColor
            
        }

    }
    
}



class FAMEXText3 {
    
        // Propiedades
    
    var Label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))                      // Label
    var Title: String = "Hola"                                                                          // Titulo del label
    var Font: String = "Plateia"                                                                        // Fuente
    var Size: CGFloat = 30                                                                              // Tamaño del texto
    var TextColor: UIColor = .white                                                                     // Color del text
    var LineBreak: Bool = true                                                                          // Salto de linea
    var TextAlignment: NSTextAlignment = .center                                                        // Alineacion del texto
        
    
        // Metodos
    
    func HandlingText3() {
        
        if LineBreak == true {
            Label.text = Title
            Label.font = UIFont(name: Font, size: Size)
            Label.numberOfLines = 0
            Label.adjustsFontSizeToFitWidth = true
            Label.minimumScaleFactor = 0.5
            Label.textAlignment = TextAlignment
            Label.textColor = TextColor
        } else {
            Label.text = Title
            Label.font = UIFont(name: Font, size: Size)
            Label.adjustsFontSizeToFitWidth = true
            Label.minimumScaleFactor = 0.5
            Label.textAlignment = TextAlignment
            Label.textColor = TextColor
        }

    }
    
}


