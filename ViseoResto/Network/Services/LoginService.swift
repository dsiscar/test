//
//  LoginService.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 07/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol LoginService: class {
  func login(loginName: String, password: String) -> Observable<Any>
}

class ApiLoginService: LoginService {

  func login(loginName: String, password: String) -> Observable<Any> {
    
    let parameters =  loginName.isValidEmail ?
    ["email": loginName, "password": password] : ["username": loginName, "password": password]
    
    return Observable<Any>.create { observer -> Disposable in
      let request = Alamofire
        .request(Endpoints.Customers.login.url, method: .post, parameters: parameters)
        .validate()
        .responseJSON(completionHandler: { (response: DataResponse<Any>) in
          switch response.result {
          case .success(let result):
            print("result \n \(result)")
            observer.onNext(result)
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
