//
//  Constants.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 20/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//


struct K {
    
    struct CryptKeys {
        static let keyData = ""
        static let ivData = "sampleText"
    }
    
    struct HostServer {

        static let apiPunk = "https://api.punkapi.com/v2"

    }
    
    enum HTTPHeaderField: String {
        case authentication   = "Authorization"
        case contentType      = "Content-Type"
        case acceptType       = "Accept"
        case acceptEncoding   = "Accept-Encoding"
        case acceptCharSet    = "Accept-Charset"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
}

