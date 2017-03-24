//
//  CustomersPresenter.swift
//  ViseoResto
//
//  Created SISCAR David (i-BP - CONSULTIME) on 23/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//
//

import Foundation
import RxSwift

protocol CustomersPresenter: class {
  func fetchCustomerData()
  func didSelectCustomer(_ customer: Customer)
}

class CustomersDefaultPresenter: CustomersPresenter {
  
  fileprivate let interactor: CustomersInteractor
  fileprivate let router: CustomersRouter
  fileprivate weak var view: CustomersView?

  let disposeBag = DisposeBag()
  
  var customers: [Customer] = [] {
    didSet {
      if customers.count > 0 {
        view?.showCustomersData(customers)
      } else {
        view?.showNoContentScreen()
      }
    }
  }
  
  required init(interactor: CustomersInteractor, router: CustomersRouter, view: CustomersView) {
    self.interactor = interactor
    self.router = router
    self.view = view
  }
  
  func fetchCustomerData() {
    view?.showLoader()
    
    interactor.fetchCustomers()?.subscribe(onNext: { customers in
      self.view?.hideLoader()
      self.customers = customers
    }, onError: { error in
      self.view?.loadingFailed(withError: error, completion: nil)
    }).disposed(by: disposeBag)
  }
  
  func didSelectCustomer(_ customer: Customer) {
    router.showDetails(forCustomer: customer)
  }
  
  func logoff() {
    print("presenter loggoff")
  }
}
