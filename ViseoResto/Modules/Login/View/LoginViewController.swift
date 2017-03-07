//
//  LoginViewController.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 01/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
  var presenter: LoginPresentation!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  fileprivate func setupView() {
    //setup
    self.title = "Login"
  }
  
  @IBAction func loginAction(_ sender: Any) {
    presenter.login("tsalvetat", password: "12345")
  }
  
  @IBAction func errorLogin(_ sender: Any) {
    presenter.login("tsalvetato", password: "123445")
  }
}

extension LoginViewController: LoginView {
  
  //here we add loginView protocols if needed
}
