//
//  CustomersDetailViewController.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 01/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

class CustomersDetailViewController: UIViewController {
  
  var customer: Customer!
  
  @IBOutlet weak var lastNameLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = customer.username
    lastNameLabel.text = customer.lastname
  }
}
