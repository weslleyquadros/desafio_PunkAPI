//
//  BeersComponents.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 19/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import UIKit

class BeersComponents {
    
    //Background
    var bgGradientLayer : CAGradientLayer = {
             let bg = CAGradientLayer()
//             bg.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.7137254902, blue: 0.2862745098, alpha: 1)
             bg.colors = [ #colorLiteral(red: 0.3105362653, green: 0.7345891494, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.2010839403, green: 0.4681100742, blue: 1, alpha: 1).cgColor]
//             bg.startPoint = CGPoint.init(x: 0.5, y: 0)
//             bg.endPoint = CGPoint.init(x: 0.5, y: 1)
        
        
             return bg
    }()
         
    var searchBeersTextField : CustomTextField = {
          let element = CustomTextField()
          element.translatesAutoresizingMaskIntoConstraints = false
          
//          guard let gotham_book = UIFont(name: "gotham-book", size: 16) else {
//              fatalError("""
//                  Failed to load the "GothamBold" font.
//                  Make sure the font file is included in the project and the font name is spelled correctly.
//              """)
//          }
//
//
//
//          element.attributedPlaceholder
//                   = NSAttributedString( string: NSLocalizedString("Buscar cerveja ...", comment: ""),
//                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.system] )
          
          element.layer.cornerRadius = 20
        
          element.autocorrectionType = .no
          element.backgroundColor = UIColor.white
          element.alpha = 0.2
          element.padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 50)
//          element.font = gotham_book
       
          element.tag = 0
          
          return element
          
      }()
    
    var cardView : UIView = {
        
        let element = UIView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = UIColor.white
        
        element.layer.cornerRadius = 15.0
        element.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        element.layer.masksToBounds = true

        return element
    }()
    
    var buttonView : UIView = { //view pra cobrir a parte de baixo dos iPhone X's
        
        let element = UIView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = UIColor.white
        
        return element
    }()
    
    var tableViewBeers : UITableView = {
         let element = UITableView.init(frame: CGRect.zero, style: .grouped)
         element.translatesAutoresizingMaskIntoConstraints = false
         element.backgroundColor = UIColor.white
//         element.layer.cornerRadius = 15.0
//         element.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
         element.separatorStyle = .none
       
         return element
     }()
    
    var titleLabel: UILabel = {
        let element = UILabel()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        
        
//        guard let gothamBook = UIFont(name: "gotham-book", size: 22) else {
//            fatalError("""
//                Failed to load the "GothamBook" font.
//                Make sure the font file is included in the project and the font name is spelled correctly.
//            """)
//        }
        let title = NSLocalizedString("Punk Beers", comment: "")
        let normalAttributteString = [.font: UIFont.systemFont(ofSize: 25), .foregroundColor: UIColor.white ] as [NSAttributedString.Key: Any]
        
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
        element.attributedText = attributedTitle
        
        return element
    }()
    
    
    
}
