//
//  BeersScreen.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 19/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//


import Foundation
import UIKit

final class BeersScreen : UIView {


    private var initialConstraints = [NSLayoutConstraint]()
    private let components: BeersComponents
    
    var iphoneX = false
    var iphoneSE = false
    
    init(components: BeersComponents, frame: CGRect ){
    
        self.components = components
        super.init(frame: frame)
        
        setupView()
        setupConstraint()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    private func setupView(){

        //Background
        components.bgGradientLayer.frame = (bounds)
        layer.addSublayer(components.bgGradientLayer)
        
        addSubview(components.titleLabel)
        
        addSubview(components.searchBeersTextField)
        components.searchBeersTextField.setIconSearchLeft()
        
        
        addSubview(components.cardView)
        
        components.cardView.addSubview(components.tableViewBeers)
        
        if UIDevice().userInterfaceIdiom == .phone {
                    switch UIScreen.main.nativeBounds.height {
                    case 1136:
        //                print("iPhone 5 or 5S or 5C")
                        iphoneSE = true
            
                        
                    case 1334: break
        //                print("iPhone 6/6S/7/8")
                        
                    case 1920, 2208: break
        //                print("iPhone 6+/6S+/7+/8+")
                        
                    case 2436:
        //                print("iPhone X, XS")
                        addSubview(components.buttonView)
                        iphoneX = true
                        
                    case 2688:
        //                print("iPhone XS Max")
                        addSubview(components.buttonView)
                        iphoneX = true
                        
                    case 1792:
        //                print("iPhone XR")
                        addSubview(components.buttonView)
                        iphoneX = true
                        
                    default:
                        print("Unknown")
                    }
            }
       
    }
    
    private func setupConstraint(){
        
        components.cardView.anchor(top: nil, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: percentOfWidth(percente: 100), height: percentOfHeight(percente: 70), trailling: nil, leading: nil)
        
        components.tableViewBeers.anchor(top: components.cardView.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: percentOfWidth(percente: 100), height: percentOfHeight(percente: 70), trailling: nil, leading: nil)
        
        if iphoneX {


            
            components.buttonView.anchor(top: components.cardView.bottomAnchor, left: nil, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: percentOfWidth(percente: 100), height: percentOfWidth(percente: 100) * 0.10, trailling: nil, leading: nil)
            
        }
        
        components.titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: percentOfHeight(percente: 2), paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
        initialConstraints.append(components.titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor))
        
        components.searchBeersTextField.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: percentOfWidth(percente: 25), paddingLeft: percentOfWidth(percente: 5), paddingBottom: 0, paddingRight: -percentOfWidth(percente: 5), width: 0, height: 40, trailling: trailingAnchor, leading: leadingAnchor)
        
        NSLayoutConstraint.activate(initialConstraints)
    }
}
