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
  
  @IBOutlet weak var usernameTextField: BaseTextField!
  @IBOutlet weak var passwordTextField: BaseTextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  fileprivate func setupView() {
    errorLabel.text = "Error text lelelel"
    errorLabel.isHidden = true
    
    //Setup conditions
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
      .bindTo(usernameTextField.rx.isValid)
      .disposed(by: disposeBag)
  
    passwordValid
      .bindTo(passwordTextField.rx.isValid)
      .disposed(by: disposeBag)
    
    everythingValid
      .bindTo(loginButton.rx.isEnabled)
      .disposed(by: disposeBag)
    
    //Setup Actions
    passwordTextField.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: { [weak self] in
      self?.callLogin()
    }).disposed(by: disposeBag)
    
    usernameTextField.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: { [weak self] in
      if self?.passwordTextField.isEnabled ?? false {
        self?.errorLabel.isHidden = true
        self?.passwordTextField.becomeFirstResponder()
      }
      else {
        self?.errorLabel.isHidden = false
      }
    }).disposed(by: disposeBag)
    
    loginButton.rx.tap
      .subscribe(onNext: { [weak self] in
        self?.callLogin()
      }).disposed(by: disposeBag)
  }
  
  private func callLogin() {
    guard let user = self.usernameTextField.text,
      let pass = self.passwordTextField.text, loginButton.isEnabled else {
        self.errorLabel.text = "check your "
        return
    }
    self.presenter.login(user, password: pass)
  }
  
  @IBAction func errorLogin(_ sender: Any) {
    presenter.login("tsalvetato", password: "123445")
  }
}

extension LoginViewController: LoginView {
  
  //here we add loginView protocols if needed
}
