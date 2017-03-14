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
    presenter.fetchCustomerData()
  }
  
  fileprivate func setupView() {
    self.title = "CustomersTitle"
    
    customers.asObservable()
      .bindTo(customersTableView
        .rx
        .items(cellIdentifier: "customerCell",
               cellType: UITableViewCell.self)) { /*row*/_, customer, cell in
                cell.textLabel?.text = customer.username
      }
      .disposed(by: disposeBag)
    
    customersTableView.rx
      .itemSelected
      .subscribe(onNext: { indexPath in
        self.presenter.didSelectCustomer(self.customers.value[indexPath.row])
      })
      .disposed(by: disposeBag)
  }
  
  @IBAction func disconnectAction(_ sender: Any) {
    //not like this tell presenter we logged off
    self.dismiss(animated: true)
  }
  
}

extension CustomersViewController: CustomersView {
  
  func showNoContentScreen() {
    // hide tableview and show a label with "Pas de résultat"
    
  }
  
  func showCustomersData(_ customers: [Customer]) {
    self.customers.value = customers
  }
}

