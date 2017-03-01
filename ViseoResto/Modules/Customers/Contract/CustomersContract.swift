//
//  CustomersContract.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit
import RxSwift

protocol CustomersView: LoadingView {
    var presenter: CustomersPresentation! { get set }
    
    func showNoContentScreen(withError error: Error?)
    func showCustomersData(_ customers: [Customer])
}

protocol CustomersPresentation {
    weak var view: CustomersView? { get set }
    var interactor: CustomersUseCase! { get set }
    var router: CustomersWireframe! { get set }
    
    func fetchCustomerData()
    func didSelectCustomer(_ customer: Customer)
}

protocol CustomersUseCase: class {
    func fetchCustomers() -> Observable<[Customer]>
}

protocol CustomersWireframe: class {
    func presentDetails(forCustomer customer: Customer)

    static func assembleModule() -> UIViewController
}
