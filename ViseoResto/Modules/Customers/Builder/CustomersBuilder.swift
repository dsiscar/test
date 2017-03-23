//
//  CustomersBuilder.swift
//  ViseoResto
//
//  Created SISCAR David (i-BP - CONSULTIME) on 23/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import Swinject

protocol CustomersBuilder {
  func buildCustomersModule() -> UIViewController?
}

struct CustomersSwiftInjectBuilder: CustomersBuilder {
  
  func buildCustomersModule() -> UIViewController? {
    registerView()
    registerInteractor()
    registerPresenter()
    registerRouter()
    
    return Container.sharedContainer.resolve(CustomersView.self) as? UIViewController
  }
  
  fileprivate func registerView() {
    let viewDescription = Container.sharedContainer.register(CustomersView.self) { _ in
      CustomersViewController.instantiate(fromAppStoryboard: .customers)
    }
    viewDescription.initCompleted { r, v in
      if let view = v as?  CustomersViewController {
        view.presenter = r.resolve(CustomersPresenter.self)
      }
    }
  }
  
  fileprivate func registerInteractor() {
    Container.sharedContainer.register(CustomersInteractor.self) { r in
      CustomersDefaultInteractor(customerService: r.resolve(CustomerService.self)!)
    }
  }
  
  fileprivate func registerPresenter() {
    Container.sharedContainer.register(CustomersPresenter.self) { c in
      CustomersDefaultPresenter(interactor: c.resolve(CustomersInteractor.self)!,
                                router: c.resolve(CustomersRouter.self)!,
                                view: c.resolve(CustomersView.self)!)
    }
  }
  
  fileprivate func registerRouter() {
    Container.sharedContainer.register(CustomersRouter.self) { c in
      CustomersDefaultRouter(viewController: (c.resolve(CustomersView.self) as? UIViewController)!)
    }
  }
}
