//
//  LoginPresenter.swift
//  ViseoResto
//
//  Created SISCAR David (i-BP - CONSULTIME) on 22/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//
//

import Foundation
import RxSwift

protocol LoginPresenter: class {
  func login(_ username: String, password: String)
}

class LoginDefaultPresenter: LoginPresenter {
  
  fileprivate let interactor: LoginInteractor
  fileprivate let router: LoginRouter
  fileprivate weak var view: LoginView?
  fileprivate let disposeBag = DisposeBag()

  required init(interactor: LoginInteractor, router: LoginRouter, view: LoginView) {
    self.interactor = interactor
    self.router = router
    self.view = view
  }
  
  func login(_ username: String, password: String) {
    view?.showLoader()
    
    interactor.loginUser(username, password: password)?.subscribe(onNext: { _ in
      self.view?.loadingSucceed { _ in
        self.router.loginToList()
      }
    }, onError: { error in
      self.view?.loadingFailed(withError: error, completion: nil)
    }).disposed(by: disposeBag)
  }
}
