//
//  UIView+Percent.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 19/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import UIKit

extension UIView {
    
    func percentOfHeight( percente : CGFloat) -> CGFloat {
        return ((frame.height * percente) / 100)
    }
    
    func percentOfWidth( percente : CGFloat) -> CGFloat {
        return ((frame.width * percente) / 100)
    }
    
}
