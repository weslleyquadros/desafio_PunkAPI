//
//  BeersViewModelProtocol.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 20/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import Foundation

protocol BeersViewModelDelegate: class {
    func isSubmitStatus(status: Bool)
    func errorMessageDidChange(message: String)
    func signupSuccess(title : String, message : String)
    func startLoading()
    func stopLoading()

}


protocol BeersViewModelProtocolDelegate: class {
    
}




protocol BeersViewModelProtocol {
    
    var viewDelegate: BeersViewModelDelegate? { get set }
    
    
    // Submit
    

    func getBeers()

    
    // Errors
    var errorMessage: String { get }
    
}
