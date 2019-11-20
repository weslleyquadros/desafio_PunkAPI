//
//  BaseAPIConfiguration.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 19/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//


import Alamofire
import Foundation

class BaseAPIConfiguration {


    @discardableResult
    static func performRequest(route : APIConfiguration, completion : @escaping (DataResponse<Any>?)-> Void) -> DataRequest {
        return AF.request(route, interceptor: LogInterceptor()) .validate(statusCode: 200...204).responseJSON { (response : DataResponse<Any>?) in
//            print("\n 🔮C Result Request: \(response?.description ?? "nil") \n")
            completion(response)
        }
    }




}
