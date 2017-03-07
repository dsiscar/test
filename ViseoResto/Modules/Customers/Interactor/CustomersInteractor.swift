//
//  CustomersInteractor.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift

class CustomersInteractor: CustomersUseCase {
    internal var service: CustomerService?
    
    internal func fetchCustomers() -> Observable<[Customer]>? {
        return self.service?.fetchCustomers()
    }
}
