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
                let alert = UIAlertController(title: "Customer", message: "Nom : \(self.customers.value[indexPath.row].lastname)", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            })
            .addDisposableTo(disposeBag)
    }
    
}

extension CustomersViewController: CustomersView {
    
    func showNoContentScreen() {
        print("empty")
    }
    
    func showCustomersData(_ customers: [Customer]) {
        self.customers.value = customers
    }
}

