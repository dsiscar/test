//
//  LoginRouter.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 01/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

class LoginRouter: LoginWireframe {
  
  weak var viewController: UIViewController?
  
  static func assembleModule() -> UIViewController {
    
    guard let view = UIViewController.load(
      fromStoryboard: "Main", identifier: "LoginViewController") as? LoginViewController,
      let interactor = try? DIPContainer.sharedContainer.resolve() as LoginUseCase else {
      return UIViewController()
    }
    
    let presenter = LoginPresenter()
    
    let router = LoginRouter()
    
    view.presenter = presenter
    
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    
    router.viewController = view
    
    return view
  }
  
  func loginToList() {
    let customerVC = CustomersRouter.assembleModule()
    viewController?.present(customerVC, animated: true)
  }
  
}
