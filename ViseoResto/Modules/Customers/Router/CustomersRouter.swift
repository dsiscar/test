//
//  CustomersRouter.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

class CustomersRouter: CustomersWireframe {
    
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        guard let view = UIViewController.load(fromStoryboard: "CustomersStoryboard", identifier: "CustomersViewController") as? CustomersViewController else  {
            return UIViewController()
        }
        
        let presenter = CustomersPresenter()
        let interactor = CustomersInteractor()
        let router = CustomersRouter()
    
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
    
        router.viewController = view
        
        return view
    }
    
    
    func presentDetails(forCustomer customer: Customer) {
        let alert = UIAlertController(title: "Customer", message: "Nom : \(customer.lastname)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
}
