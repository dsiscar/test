//
//  DIPContainer.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 07/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Dip

enum Module: String, DependencyTagConvertible {
  case customers
  case login
}

struct DIPContainer {
  static let sharedContainer = DependencyContainer()
  
  static func setup() {
    //Setup Login
    
    sharedContainer.register { LoginService() }
    sharedContainer.register { LoginService() as Service }
    sharedContainer.register { LoginInteractor() as LoginUseCase }
      .resolvingProperties { _, interactor in
        interactor.service = try sharedContainer.resolve()
    }
    
    //Setup Customer
    sharedContainer.register { CustomerService() }
    sharedContainer.register { CustomerService() as Service }
    sharedContainer.register { CustomersInteractor() as CustomersUseCase }
      .resolvingProperties { _, interactor in
        interactor.service = try sharedContainer.resolve()
    }
  }
}
