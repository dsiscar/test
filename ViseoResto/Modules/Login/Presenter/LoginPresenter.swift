//
//  LoginPresenter.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 01/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import RxSwift

class LoginPresenter: LoginPresentation {
  
  weak var view: LoginView?
  var interactor: LoginUseCase!
  var router: LoginWireframe!
  let disposeBag = DisposeBag()
  
  func login(_ username: String, password: String) {
    view?.showLoader()
    
    interactor.loginUser(username, password: password)?.subscribe(onNext: { _ in
      self.view?.loadingSucceed { _ in
        self.router.loginToList()
      }
    }, onError: { error in
      self.view?.loadingFailed(withError: error, completion: nil)
    }).addDisposableTo(disposeBag)
    
  }
}
