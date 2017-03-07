//
//  CustomersRouter.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

class CustomersRouter: CustomersWireframe {
  
  weak var navController: UINavigationController?
  
  static func createDetailCustomer(_ customer: Customer) -> UIViewController {
    guard let view = UIViewController.load(
      fromStoryboard: "CustomersStoryboard",
      identifier: "CustomersDetailViewController") as? CustomersDetailViewController else {
        return UIViewController()
    }
    
    view.customer = customer
    
    return view
  }
  
  static func assembleModule() -> UIViewController {
    
    guard let navController = UIViewController.load(
      fromStoryboard: "CustomersStoryboard",
      identifier: "CustomersNavController") as? UINavigationController,
      let view = navController.childViewControllers.first as? CustomersViewController,
      let interactor = try? DIPContainer.sharedContainer.resolve() as CustomersUseCase else {
        return UIViewController()
    }
    
    let presenter = CustomersPresenter()
    let router = CustomersRouter()
    
    view.presenter = presenter
    
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    
    router.navController = navController
    
    return navController
  }
  
  func presentDetails(forCustomer customer: Customer) {
    let controller = CustomersRouter.createDetailCustomer(customer)
    navController?.pushViewController(controller, animated: true)
  }
}
