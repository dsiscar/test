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
        
        guard let view = UIViewController.load(fromStoryboard: "CustomersStoryboard", identifier: "customersVC") as? CustomersViewController else  {
            return UIViewController()
        }
        
        let presenter = CustomersPresenter()
        let interactor = CustomersInteractor()
        let router = CustomersRouter()
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.viewController = view
        
        return navigation
    }
    
    
    func presentDetails(forCustomer customer: Customer) {
        //let detailsModuleViewController = DetailsRouter.assembleModule(article)
        //viewController?.navigationController?.pushViewController(detailsModuleViewController, animated: true)
    }
}
