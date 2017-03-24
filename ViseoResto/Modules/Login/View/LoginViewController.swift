//
//  LoginViewController.swift
//  ViseoResto
//
//  Created SISCAR David (i-BP - CONSULTIME) on 22/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol LoginView: LoadingView {
  
}

class LoginViewController: UIViewController, LoginView {
  
  var presenter: LoginPresenter?
  
  let minimalUsernameLength = 6
  let minimalPasswordLength = 5
  let disposeBag = DisposeBag()
  var userError: Observable<Bool>?
  
  @IBOutlet weak var usernameTextField: BaseTextField!
  @IBOutlet weak var passwordTextField: BaseTextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.addClosekeyboardTap()
    
    setupView()
  }
  
  fileprivate func setupView() {
    self.view.backgroundColor = AppColor.backgroundColor
    self.setupRxConditions()
    self.setupRxActions()
  }
  
  fileprivate func callLogin() {
    guard let user = usernameTextField.text,
      let pass = passwordTextField.text, loginButton.isEnabled else {
        self.showError(withMessage: "error on textfields")
        return
    }
    self.presenter?.login(user, password: pass)
  }
  
  @IBAction func errorLogin(_ sender: Any) {
    presenter?.login("tsalvetat", password: "12345")
  }
  
  func showError(withMessage message: String? = "Une erreur est survenue") {
    self.errorLabel.text = message
    UIView.animate(withDuration: 0.35) {
      self.errorLabel.alpha = 1
    }
  }
  
  func hideError() {
    self.errorLabel.text = ""
    UIView.animate(withDuration: 0.35) {
      self.errorLabel.alpha = 0
    }
  }
}

extension LoginViewController {
  
  fileprivate func setupRxConditions() {
    //Setup conditions
    let usernameValid = usernameTextField.rx.text.orEmpty
      .map { $0.isValidEmail }
      .shareReplay(1)
    
    let passwordValid = passwordTextField.rx.text.orEmpty
      .map { $0.characters.count >= self.minimalPasswordLength }
      .shareReplay(1)
    
    let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
      .shareReplay(1)
    
    usernameValid.bindTo(usernameTextField.rx.isValid).disposed(by: disposeBag)
    
    passwordValid.bindTo(passwordTextField.rx.isValid).disposed(by: disposeBag)
    
    everythingValid.bindTo(loginButton.rx.isEnabled).disposed(by: disposeBag)
    
  }
  
  fileprivate func setupRxActions() {
    usernameTextField.rx.controlEvent(.editingDidBegin).subscribe(onNext: { [weak self] in
      self?.hideError()
    }).disposed(by: disposeBag)
    
    passwordTextField.rx.controlEvent(.editingDidBegin).subscribe(onNext: { [weak self] in
      self?.hideError()
    }).disposed(by: disposeBag)
    
    passwordTextField.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: { [weak self] in
      self?.callLogin()
    }).disposed(by: disposeBag)
    
    usernameTextField.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: { [weak self] in
      self?.hideError()
      if let _ = self?.passwordTextField.text?.isEmpty {
        self?.passwordTextField.becomeFirstResponder()
      }
    }).disposed(by: disposeBag)
    
    loginButton.rx.tap
      .subscribe(onNext: { [weak self] in
        self?.callLogin()
      }).disposed(by: disposeBag)
  }
}
