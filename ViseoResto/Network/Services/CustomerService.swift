//
//  CustomerService.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift

class CustomerService: Service {
  
  func fetchCustomers() -> Observable<[Customer]> {
    return Observable<[Customer]>.create { observer -> Disposable in
      let request = self.sessionManager
        .request(Endpoints.Customers.fetch.url, method: .get)
        .validate()
        .responseArray(completionHandler: { (response: DataResponse<[Customer]>) in
          switch response.result {
          case .success(let customers):
            print("result \n \(customers)")
            observer.onNext(customers)
            observer.onCompleted()
            
          case .failure(let error):
            observer.onError(error)
          }
        })
      
      return Disposables.create(with: {
        request.cancel()
      })
    }
  }
}

