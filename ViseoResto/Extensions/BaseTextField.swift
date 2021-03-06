//
//  BaseTextField.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 14/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

public class BaseTextField: UITextField {
  
  let padding: CGFloat = 10.0
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setup()
  }
  
  func setup() {
    self.font = UIFont.systemFont(ofSize: 16)
    self.layer.cornerRadius = 2
    self.spellCheckingType = .no
    self.autocorrectionType = .no
    self.borderStyle = .roundedRect
    self.enablesReturnKeyAutomatically = true
  }
  
  public var isError: Bool = false {
    didSet {
      guard let empty = text?.isEmpty, !empty else {
        return
      }
      let condition = isError && self.isEnabled
      self.layer.borderColor = condition ? UIColor.red.cgColor : UIColor.darkGray.cgColor
      self.layer.borderWidth = condition ? 2 : 1
    }
  }
  
  public var isValid: Bool = true {
    didSet {
      self.isError = !isValid
    }
  }
  
  override public var isEnabled: Bool {
    didSet {
      self.alpha = isEnabled ? 1 : 0.3
      self.backgroundColor = isEnabled ? UIColor.clear : UIColor.white
    }
  }
  
  override public func updateConstraints() {
    super.updateConstraints()
   
    self.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
  
  override public func textRect(forBounds bounds: CGRect) -> CGRect {
    var rect = bounds
    rect.origin.x = rect.origin.x + padding
    
    return rect
  }
  
  override public func editingRect(forBounds bounds: CGRect) -> CGRect {
    var rect = bounds
    rect.origin.x = rect.origin.x + padding
    
    return rect
  }
}
