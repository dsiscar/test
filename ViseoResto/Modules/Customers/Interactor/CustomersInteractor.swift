//
//  CustomersInteractor.swift
//  ViseoResto
//
//  Created SISCAR David (i-BP - CONSULTIME) on 23/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import RxSwift

public protocol CustomersInteractor {
  func fetchCustomers() -> Observable<[Customer]>?
}

class CustomersDefaultInteractor: CustomersInteractor {
  
  let customerService: CustomerService
  
  required init(customerService: CustomerService) {
    self.customerService = customerService
  }
  
  func fetchCustomers() -> Observable<[Customer]>? {
    return self.customerService.fetchCustomers()
  }
}
