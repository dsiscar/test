//
//  UIViewControllerHelper.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

extension UIViewController {
  
  /// Load a view controller form a storyboard.
  ///
  /// - parameter storyboard: The storyboard name.
  /// - parameter identifier: The view controller identifier in the given storyboard.
  /// - returns: The view controller or `nil`.
  class func load(
    fromStoryboard storyboard: String, identifier: String? = nil) -> UIViewController? {
    
    let storyboardRef = UIStoryboard(name: storyboard, bundle: nil)
    
    guard let controller = identifier else {
      return storyboardRef.instantiateInitialViewController()
    }
    
    return storyboardRef.instantiateViewController(withIdentifier: controller)
  }
  
  ///Add a UITapGestureRecognizer to the view to handle a tap and close keyboard
  func addClosekeyboardTap() {
    let tapGesture = UITapGestureRecognizer(
      target: self, action: #selector(self.closeKeyboard))
    self.view.addGestureRecognizer(tapGesture)
  }
  
  func closeKeyboard() {
    self.view.endEditing(true)
  }
}

extension UIViewController {
  /// The inferred controller's storyboard identifier.
  /// This attribut can be overridden by any UIViewController classes.
  /// - seealso: `AppStoryboard.viewController(withControllerType:)`
  class var storyboardId: String {
    return "\(self)"
  }
  
  /// Instantiate the view controller from the given storyboard.
  /// To find the correct instance of the view controller inside the storyboard, a storyboard identifier inference
  /// if performed. The inferred storyboard identifier is the view controller's class name.
  /// - seealso: `storyboardId`
  static func instantiate(fromAppStoryboard storyboard: AppStoryboard) -> Self {
    return storyboard.viewController(withControllerType: self)
  }
}
