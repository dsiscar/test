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
        presenter.viewDidLoad()
    }
    
    fileprivate func setupView() {
       //setup
        self.title = "Login"
    }
    
    @IBAction func loginAction(_ sender: Any) {
        presenter.login("tsalvetat", password: "12345")
    }
    
}


extension LoginViewController: LoginView {
    
    func toto() {
        print("toto")
    }
}
