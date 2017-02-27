//
//  CustomersContract.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

protocol CustomersView: IndicatableView {
    var presenter: CustomersPresentation! { get set }
    
    func showNoContentScreen()
    func showCustomersData(_ customers: [Customer])
}

protocol CustomersPresentation {
    weak var view: CustomersView? { get set }
    var interactor: CustomersUseCase! { get set }
    var router: CustomersWireframe! { get set }
    
    func viewDidLoad()
}

protocol CustomersUseCase: class {
    weak var output: CustomersInteractorOutput! { get set }
    
    func fetchCustomers()
}

protocol CustomersInteractorOutput: class {
    func customersFetched(_ customers: [Customer])
    func customersFetchFailed()
}

protocol CustomersWireframe: class {
    func presentDetails(forCustomer customer: Customer)

    static func assembleModule() -> UIViewController
}
