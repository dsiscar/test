//
//  LoginRouter.swift
//  ViseoResto
//
//  Created SISCAR David (i-BP - CONSULTIME) on 22/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import Swinject

protocol LoginRouter {
  func loginToList()
}

class LoginDefaultRouter: LoginRouter, RootWireframe {
  
  weak var viewController: UIViewController?
  
  init (viewController: UIViewController) {
    self.viewController = viewController
  }
  
  func bootstrap(onWindow window: UIWindow) {
    guard let viewController = viewController else {
      print("Cannot bootstrap Login")
      return
    }
    self.showRootViewController(viewController, inWindow: window)
  }
  
  fileprivate func customersBuilder() -> CustomersBuilder? {
    return Container.sharedContainer.resolve(CustomersBuilder.self)
  }
  
  func loginToList() {
    if let customerVC = self.customersBuilder()?.buildCustomersModule() {
      let navController = UINavigationController(rootViewController: customerVC)
      self.viewController?.present(navController, animated: true, completion: nil)
    }
  }
}
