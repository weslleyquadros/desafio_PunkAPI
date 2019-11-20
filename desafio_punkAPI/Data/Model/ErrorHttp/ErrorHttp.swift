//
//  ErrorHttp.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 20/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import Foundation

struct ErrorHttp: Codable, Error {
    let statusCode : Int?
    let error : String?
    let message: String?
    
}
