//
//  CustomersPresenter.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import RxSwift

class CustomersPresenter: CustomersPresentation {
  
  weak var view: CustomersView?
  var interactor: CustomersUseCase!
  var router: CustomersWireframe!
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
    router.presentDetails(forCustomer: customer)
  }
  
  func logoff() {
    print("presenter loggoff")
  }
}
