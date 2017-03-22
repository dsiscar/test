//
//  LoginInteractor.swift
//  ViseoResto
//
//  Created SISCAR David (i-BP - CONSULTIME) on 22/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import RxSwift

public protocol LoginInteractor {
  func loginUser(_ username: String, password: String) -> Observable<Any>?
}

class LoginDefaultInteractor: LoginInteractor {
  
  let loginService: LoginService
  
  required init(loginService: LoginService) {
    self.loginService = loginService
  }
  
  func loginUser(_ username: String, password: String) -> Observable<Any>? {
    return loginService.login(loginName: username, password: password)
  }
}
