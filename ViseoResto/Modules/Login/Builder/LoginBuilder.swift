//
//  LoginBuilder.swift
//  ViseoResto
//
//  Created SISCAR David (i-BP - CONSULTIME) on 22/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import Swinject

protocol LoginBuilder {
  func buildLoginModule() -> UIViewController?
}

struct LoginSwiftInjectBuilder: LoginBuilder {
  
  func buildLoginModule() -> UIViewController? {
    registerView()
    registerInteractor()
    registerPresenter()
    registerRouter()
    
    return Container.sharedContainer.resolve(LoginView.self) as? UIViewController
  }
  
  fileprivate func registerView() {
    let viewDescription = Container.sharedContainer.register(LoginView.self) { _ in
      LoginViewController.instantiate(fromAppStoryboard: .main)
    }
    viewDescription.initCompleted { r, v in
      if let view = v as?  LoginViewController {
        view.presenter = r.resolve(LoginPresenter.self)
      }
    }
  }
  
  fileprivate func registerInteractor() {
    Container.sharedContainer.register(LoginInteractor.self) { r in
       LoginDefaultInteractor(loginService: r.resolve(LoginService.self)!)
    }
  }
  
  fileprivate func registerPresenter() {
    Container.sharedContainer.register(LoginPresenter.self) { c in
      LoginDefaultPresenter(interactor: c.resolve(LoginInteractor.self)!,
                                router: c.resolve(LoginRouter.self)!,
                                view: c.resolve(LoginView.self)!)
    }
  }
  
  fileprivate func registerRouter() {
    Container.sharedContainer.register(LoginRouter.self) { c in
      LoginDefaultRouter(viewController: (c.resolve(LoginView.self) as? UIViewController)!)
    }
  }
}
