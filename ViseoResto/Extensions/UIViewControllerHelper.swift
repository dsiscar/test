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
