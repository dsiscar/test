//
//  ReactiveExtension.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 14/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

#if !RX_NO_MODULE
  import RxSwift
  import RxCocoa
#endif

extension Reactive where Base: BaseTextField {

  public var isError: UIBindingObserver<Base, Bool> {
    return UIBindingObserver(UIElement: self.base) { textfield, value in
      textfield.isError = value
    }
  }
  
  public var isValid: UIBindingObserver<Base, Bool> {
    return UIBindingObserver(UIElement: self.base) { textfield, value in
      textfield.isValid = value
    }
  }
}
