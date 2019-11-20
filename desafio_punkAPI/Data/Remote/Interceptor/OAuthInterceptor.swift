//
//  OAuthInterceptor.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 20/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import Foundation

import Alamofire
import RxSwift

class OAuthInterceptor: RequestInterceptor {
  
    private var disposeBag = DisposeBag()
    private var accessToken: String
    
    init(accessToken : String) {
        self.accessToken = accessToken
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest>) -> Void) {
        
        var newUrlRequest = urlRequest
        
        newUrlRequest.addValue("Bearer \(accessToken)", forHTTPHeaderField: K.HTTPHeaderField.authentication.rawValue)
        
        print("\n\n 🚀 Running request(OAuth): \n method: [ \(newUrlRequest.httpMethod ?? "") ] \n host: [ \(newUrlRequest.url?.absoluteString ?? "") ] \n header: [  \(newUrlRequest.httpHeaders.description ) ] \n body: [ \( newUrlRequest.httpBody == nil ? "nil" : OAuthInterceptor.escapeAllSingleQuotes(String(data: newUrlRequest.httpBody!, encoding: String.Encoding.utf8)!) ) ] \nOi eu sou o GOKU")
        
        completion(.success(newUrlRequest))
        
    }
    
    /// Escapes all single quotes for shell from a given string.
    static func escapeAllSingleQuotes(_ value: String) -> String {
        return value.replacingOccurrences(of: "'", with: "'\\''")
    }
    
  
    
}
