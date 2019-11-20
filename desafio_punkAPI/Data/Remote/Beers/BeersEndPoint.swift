//
//  BeersEndPoint.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 20/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import Alamofire

enum BeersEndPoint: APIConfiguration {
    
    case getBeers
    
    
    // HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getBeers:
            return .get
        
        }
    }
    
    // Path
    var path: String {
        switch self {
        case .getBeers:
            return "/beers"
  
        }
    }
    
    // MARK: - URL query
    var baseURL: URL{
        switch self {
        case .getBeers:
            return URL(string: "\(K.HostServer.apiPunk)")!
            
        }
    }
    
    // Header Parameters
    var headerParameters: [String : String]? {
        switch self {
        case .getBeers:
            return [
                K.HTTPHeaderField.acceptType.rawValue : K.ContentType.json.rawValue,
                K.HTTPHeaderField.contentType.rawValue : K.ContentType.json.rawValue
            ]
       

        }
    }
    
    // Body Parameters
    var parameters: Parameters? {
        switch self {
        case .getBeers:
            return nil
        
        }
        
    }
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Headers Parameter
        headerParameters?.forEach({ headerParameter in
            urlRequest.addValue(headerParameter.value, forHTTPHeaderField: headerParameter.key)
        })
        
        // Body Parameter
        if let parameters = parameters {
            do {
                debugPrint(parameters)
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
