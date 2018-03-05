//
//  CustomSearchBar.swift
//  CustomCell_Demo
//
//  Created by Luis Rollon Gordo on 1/11/16.
//  Copyright © 2016 EfectoApple. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    var preferredFont: UIFont!
    
    var preferredTextColor: UIColor!
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        // Encuentra el index del search field en las subvistas del SearchBar
        if let index = indexOfSearchFieldInSubviews() {
            // Accedemos al search field
            let searchField: UITextField = (subviews[0] ).subviews[index] as! UITextField
            
            // Configuramos su frame
            searchField.frame = CGRect(x: 5.0, y: 5.0, width: frame.size.width - 10.0, height: frame.size.height - 10.0)
            
            // Configuramos la fuente, el color del texto y el color de fondo del search field
            searchField.font = preferredFont
            searchField.textColor = preferredTextColor
            searchField.backgroundColor = barTintColor
        }
        
        //Creamos la linea que se situará justo debajo de nuestra UISearchBar
        let startPoint = CGPoint(x: 0.0, y: frame.size.height)
        let endPoint = CGPoint(x: frame.size.width, y: frame.size.height)
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = preferredTextColor.cgColor
        shapeLayer.lineWidth = 2.5
        
        layer.addSublayer(shapeLayer)
        
    }

    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)
        
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        
        searchBarStyle = UISearchBarStyle.prominent
        isTranslucent = false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Función que devuelve el index del SearchField, dentro de todas las subviews del SearchBar
    func indexOfSearchFieldInSubviews() -> Int! {

        var index: Int!
        let searchBarView = subviews[0]
        
        for i in 0 ..< searchBarView.subviews.count {
            if searchBarView.subviews[i].isKind(of: UITextField.self) {
                index = i
                break
            }
        }
        
        return index
    }
}
