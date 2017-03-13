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
  
  let minimalUsernameLength = 6
  let minimalPasswordLength = 5
  let disposeBag = DisposeBag()
  
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  fileprivate func setupView() {
    errorLabel.text = "Error text lelelel"
    errorLabel.isHidden = true
    
    //make an extension to textfield
    self.usernameTextField.layer.borderWidth = 1
    
    let usernameValid = usernameTextField.rx.text.orEmpty
      .map { $0.isValidEmail }
      .shareReplay(1)
    
    let passwordValid = passwordTextField.rx.text.orEmpty
      .map { $0.characters.count >= self.minimalPasswordLength }
      .shareReplay(1)
    
    let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
      .shareReplay(1)
    
    usernameValid
      .bindTo(passwordTextField.rx.isEnabled)
      .disposed(by: disposeBag)
    
    usernameValid
      .map { $0 ? UIColor.green.cgColor : UIColor.red.cgColor }
      .bindTo(usernameTextField.rx.borderColor)
      .disposed(by: disposeBag)
    
    everythingValid
      .bindTo(loginButton.rx.isEnabled)
      .disposed(by: disposeBag)
    
//    usernameTextField.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: { [unowned self] in
//     //self?.manageError if usernamenotgood
//    }).disposed(by: disposeBag)
    
    loginButton.rx.tap
      .subscribe(onNext: { [weak self] in
        guard let user = self?.usernameTextField.text,
          let pass = self?.passwordTextField.text else { return }
        self?.presenter.login(user, password: pass)
      })
      .disposed(by: disposeBag)

  }
  
  @IBAction func errorLogin(_ sender: Any) {
    presenter.login("tsalvetato", password: "123445")
  }
}

extension LoginViewController: LoginView {
  
  //here we add loginView protocols if needed
}
