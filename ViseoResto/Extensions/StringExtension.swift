//
//  StringExtension.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 13/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit
#if !RX_NO_MODULE
  import RxSwift
  import RxCocoa
#endif

extension String {
  var isValidEmail: Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: self)
  }
}

//put this into ReactiveExtensions
extension Reactive where Base: UITextField {
  public var borderColor: UIBindingObserver<Base, CGColor?> {
    return UIBindingObserver(UIElement: self.base) { textfield, color in
      textfield.layer.borderColor = color
    }
  }
}
