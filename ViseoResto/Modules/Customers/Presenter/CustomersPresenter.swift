//
//  CustomersPresenter.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation

class CustomersPresenter: CustomersPresentation {
    
    weak var view: CustomersView?
    var interactor: CustomersUseCase!
    var router: CustomersWireframe!
    
    var customers: [Customer] = [] {
        didSet {
            if customers.count > 0 {
                view?.showCustomersData(customers)
            } else {
                view?.showNoContentScreen()
            }
        }
    }
    
    func viewDidLoad() {
        interactor.fetchCustomers()
        view?.showActivityIndicator()
    }
    
    func didSelectCustomer(_ customer: Customer) {
        router.presentDetails(forCustomer: customer)
    }
}

extension CustomersPresenter: CustomersInteractorOutput {    
    func customersFetched(_ customers: [Customer]) {
        self.customers = customers
        view?.hideActivityIndicator()
    }
    
    internal func customersFetchFailed() {
        view?.showNoContentScreen()
        view?.hideActivityIndicator()
    }
}
