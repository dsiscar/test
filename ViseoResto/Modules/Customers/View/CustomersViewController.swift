//
//  CustomersViewController.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CustomersViewController: UIViewController {
    
    @IBOutlet weak var customersTableView: UITableView!
    
    var presenter: CustomersPresentation!
    var customers: Variable<[Customer]> = Variable([]) {
        didSet {
            customersTableView.reloadData()
        }
    }
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
    
    fileprivate func setupView() {
        customers.asObservable()
            .bindTo(customersTableView
                .rx
                .items(cellIdentifier: "customerCell",
                       cellType: UITableViewCell.self)) {
                        row, customer, cell in
                        cell.textLabel?.text = customer.username
        }
        .addDisposableTo(disposeBag)
        
        customersTableView.rx
            .itemSelected
            .subscribe(onNext: { indexPath in
                self.presenter.didSelectCustomer(self.customers.value[indexPath.row])
            })
            .addDisposableTo(disposeBag)
    }
    
}

extension CustomersViewController: CustomersView, ErrorManager {

    func showNoContentScreen(withError error: Error?) {
        guard let error = error else {
            var emptyCustomer = Customer()
            emptyCustomer.username = "Il n'y aucun résultat"
            self.customers.value = [emptyCustomer]
            return
        }
        
        self.manageError(error)
    }
    
    func showCustomersData(_ customers: [Customer]) {
        self.customers.value = customers
    }
}

