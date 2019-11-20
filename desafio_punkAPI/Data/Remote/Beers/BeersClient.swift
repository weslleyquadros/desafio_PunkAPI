//
//  BeersClient.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 20/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import Alamofire
import RxSwift

class BeersClient : BaseAPIConfiguration {
    
    
    static func getBeersActionRX() -> Observable<Beer> {
        
           return Observable.create({ (observable) -> Disposable in

                            let request = performRequest(route: BeersEndPoint.getBeers, completion: { response in
                                
                               print("Pega a response: \(response)")

//
                                if response?.response?.statusCode == 200                                                                                                                                                                                                                            {
                                   print("\nErro é nil")
                                    if let data = response!.data, let utf8Text = String(data: data, encoding: .utf8) {
                                        let json = utf8Text.data(using: .utf8)

                                        do {
                                            let decoder = JSONDecoder()
                                            let decoderJson = try decoder.decode(Beer.self, from: json!)
                                            observable.onNext(decoderJson)
                                            observable.onCompleted()
                                        } catch let error {
                                            observable.onError(error)
                                        }

                                    }
                                } else {
                                    print("\n Tem erro")
                                    if let data = response!.data, let utf8Text = String(data: data, encoding: .utf8) {
                                        let json = utf8Text.data(using: .utf8)
                                        do {
                                            let decoder = JSONDecoder()
                                            let errorHttp = try decoder.decode(ErrorHttp.self, from: json!)
                                            print("ERROR \(errorHttp)")
                                            observable.onError(errorHttp)

                                        } catch let error {
                                            print("Ocorreu um erro ao buscar os dados \(error)")
                                        }
                                    }


                                }

                                
//                                switch response?.response?.statusCode {
//
//                                case 200:
//
//                                       if let data = response!.data, let utf8Text = String(data: data, encoding: .utf8) {
//                                            let json = utf8Text.data(using: .utf8)
//
//                                            do {
//                                                let decoder = JSONDecoder()
//                                                let decoderJson = try decoder.decode(Beer.self, from: json!)
//                                                observable.onNext(decoderJson)
//                                                observable.onCompleted()
//                                            } catch let error {
//                                                observable.onError(error)
//                                            }
//
//                                        }
//                                        break
//                                case 500:
////                                    observable.onError(ErrorHttp(messageCode: response?.response?.statusCode,
////                                                                 message: MessageREST(title: "", message: NSLocalizedString("error_message_status_code_500",
////                                                                                                                            comment: "error_message_status_code_500"))))
//
//                                    print("DEU 500")
//                                    break
//                                default:
////                                    observable.onError(ErrorHttp(messageCode: response?.response?.statusCode,
////                                                                 message: MessageREST(title: "", message: response?.error?.localizedDescription ?? "" )))
//                                    if let data = response!.data, let utf8Text = String(data: data, encoding: .utf8) {
//                                        let json = utf8Text.data(using: .utf8)
//                                        do {
//                                            let decoder = JSONDecoder()
//                                            let errorHttp = try decoder.decode(ErrorHttp.self, from: json!)
//                                            print("ERROR \(errorHttp)")
//                                            observable.onError(errorHttp)
//
//                                        } catch let error {
//                                            print("Ocorreu um erro ao buscar os dados \(error)")
//                                        }
//                                    }
//
//                                    break
//                                }
                            })

                            return Disposables.create {
                                request.cancel()
                            }

                        })
    }
    
}
