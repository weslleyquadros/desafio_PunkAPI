//
//  BeersViewModel.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 20/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit
import Alamofire
import AVFoundation


class BeersViewModel: BeersViewModelProtocol {
    private var disposeBag = DisposeBag()

    var viewDelegate: BeersViewModelDelegate?
    
   
       /// Errors
    fileprivate(set) var errorMessage: String = "" {
        didSet {
            viewDelegate?.errorMessageDidChange(message: errorMessage)
        }
    }
    
    
    func getBeers() {
            
        viewDelegate?.startLoading()
                  
        print("vai comecar a busca")
        
      
               
        BeersClient.getBeersActionRX()
                            .observeOn(MainScheduler.instance)
                            .subscribe(
                                onNext: { response in
                                    
                                    self.viewDelegate?.stopLoading()
                               
                                        print("GET REALIZADO COM SUCESSO")
               //                         self.refreshUser()
                                
                                    
                            },
                               onError: { error in
                                
                                self.viewDelegate?.stopLoading()
                                
                                if let errorObject = error as? ErrorHttp {
                                    self.errorMessage = errorObject.message ?? ""
                                } else {
                                    self.errorMessage = NSLocalizedString("Ops, alguma coisa deu errada. :/", comment: "")
                                    debugPrint("Ocorreu um error no BeersViewModel -> Submit \(error)")
                                }
                                
                            }).disposed(by: self.disposeBag)

       }

}
