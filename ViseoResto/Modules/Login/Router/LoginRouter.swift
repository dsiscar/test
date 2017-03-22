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

class LoginDefaultRouter: LoginRouter {
  
  weak var viewController: UIViewController?
  
  init (viewController: UIViewController) {
    self.viewController = viewController
  }
  
//  fileprivate func customerBuilder() -> CustomerBuilder? {
//    return Container.sharedContainer.resolve(CustomerBuilder.self)
//  }
  
  func loginToList() {
//    if let customerVC = self.customerBuilder()?.buildCustomerModule() {
//      let navController = UINavigationController(rootViewController: customerVC)
//      self.viewController?.present(navController, animated: true, completion: nil)
//    }
  }
}
