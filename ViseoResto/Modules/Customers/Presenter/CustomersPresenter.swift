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
                view?.showNoContentScreen(withError: nil)
            }
        }
    }
    
    func fetchCustomerData() {
        view?.showLoader()
        
        interactor.fetchCustomers().subscribe(onNext: { customers in
            self.customers = customers
        }, onError: { error in
            self.view?.showNoContentScreen(withError: error)
        }) {
            self.view?.hideLoader()
        }.addDisposableTo(disposeBag)
    }
    
    func didSelectCustomer(_ customer: Customer) {
        router.presentDetails(forCustomer: customer)
    }
}
