//
//  ListBeersCell.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 20/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import UIKit

struct BeersClass {
    var image : UIImage
    var name : String
    var abv : String

}

class ListBeersCell : UITableViewCell {

    var listBeer : BeersClass? {
        didSet {
            imageBeer.image = listBeer?.image
            nameBeer.text = listBeer?.name
            abvBeer.text = listBeer?.abv
        
        }
    }
      override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            selectionStyle = .none
            
        
          
            contentView.addSubview(imageBeer)
            contentView.addSubview(nameBeer)
            contentView.addSubview(abvBeer)
 

           
          
            imageBeer.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft:  percentOfWidth(percente: 8), paddingBottom: 0, paddingRight: 0, width: 150, height: 120, trailling: nil, leading: nil)
            
            imageBeer.centerY(inView: self)
            
            nameBeer.anchor(top: imageBeer.topAnchor, left: imageBeer.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: percentOfWidth(percente: 5), paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
            
            
            abvBeer.anchor(top: nameBeer.bottomAnchor, left: imageBeer.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: percentOfWidth(percente: 5), paddingBottom: 0, paddingRight: -70, width: 0, height: 0, trailling: nil, leading: nil)
            
 
        
        }
        
        
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
      
        
       
        
        var imageBeer : UIImageView = {
            let element = UIImageView ()
            element.translatesAutoresizingMaskIntoConstraints = false
            element.backgroundColor = UIColor.gray
//            element.image = #imageLiteral(resourceName: "beers")
//            element.contentMode = .scaleAspectFit
            
//            element.layer.cornerRadius = element.frame.height / 2
            element.layer.masksToBounds = false
            element.layer.cornerRadius = 20
//            element.clipsToBounds = true
                  
            return element
        }()
 
        
        var nameBeer: UILabel = {
            let component = UILabel()
            component.translatesAutoresizingMaskIntoConstraints = false
            component.numberOfLines = -1
            
      
            let title = "Skol"
            
            let normalAttributteString = [.font: UIFont.boldSystemFont(ofSize: 22), .foregroundColor:UIColor.gray] as [NSAttributedString.Key: Any]
            
            let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
            
            component.attributedText = attributedTitle
            component.textAlignment = .center
            
            return component
        }()
        
        var abvBeer: UILabel = {
            let component = UILabel()
            component.translatesAutoresizingMaskIntoConstraints = false
            component.numberOfLines = 2
            
      
            let title = "4,3%"
            
            let normalAttributteString = [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.gray] as [NSAttributedString.Key: Any]
            
            let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
            
            component.attributedText = attributedTitle
    //        component.textAlignment = .center
            
            return component
        }()
        
       
 

}
