//
//  LogInterceptor.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 20/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import Alamofire

class LogInterceptor: RequestInterceptor {
    
    init() { }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest>) -> Void) {
        
        print("\n\n 🚀 Running request(Log): \n method: [ \(urlRequest.httpMethod ?? "") ] \n host: [ \(urlRequest.url?.absoluteString ?? "") ] \n header: [  \(urlRequest.httpHeaders.description ) ] \n body: [ \( urlRequest.httpBody == nil ? "nil" : OAuthInterceptor.escapeAllSingleQuotes(String(data: urlRequest.httpBody!, encoding: String.Encoding.utf8)!) ) ] ")
        
        completion(.success(urlRequest))
        
    }
    
}
