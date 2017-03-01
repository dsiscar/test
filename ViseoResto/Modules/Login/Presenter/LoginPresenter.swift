//
//  LoginPresenter.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 01/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import RxSwift

class LoginPresenter: LoginPresentation {
    
    weak var view: LoginView?
    var interactor: LoginUseCase!
    var router: LoginWireframe!
    let disposeBag = DisposeBag()
    
    func viewDidLoad() {
        
        print("coucou")
    }
    
    func login() {
        router.showDashboard()
    }
}
