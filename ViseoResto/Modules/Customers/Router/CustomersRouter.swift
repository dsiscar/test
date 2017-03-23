//
//  CustomersRouter.swift
//  ViseoResto
//
//  Created SISCAR David (i-BP - CONSULTIME) on 23/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import Swinject

protocol CustomersRouter {
  func presentDetails(forCustomer customer: Customer)
}

class CustomersDefaultRouter: CustomersRouter {
  
  weak var viewController: UIViewController?
  
  init (viewController: UIViewController) {
    self.viewController = viewController
  }
  
  func presentDetails(forCustomer customer: Customer) {
    let details = CustomersDetailViewController.instantiate(fromAppStoryboard: .customers)
    details.customer = customer
    viewController?.navigationController?.pushViewController(details, animated: true)
  }
}
