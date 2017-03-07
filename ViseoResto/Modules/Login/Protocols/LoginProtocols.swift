//
//  LoginProtocols.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 01/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit
import RxSwift

protocol LoginView: LoadingView {
  var presenter: LoginPresentation! { get set }
  
}

protocol LoginPresentation {
  weak var view: LoginView? { get set }
  var interactor: LoginUseCase! { get set }
  var router: LoginWireframe! { get set }
  
  func login(_ username: String, password: String)
}

protocol LoginUseCase: class {
  var service: LoginService? { get set }
  func loginUser(_ username: String, password: String) -> Observable<Any>?
}

protocol LoginWireframe: class {
  func loginToList()
  
  static func assembleModule() -> UIViewController
}
