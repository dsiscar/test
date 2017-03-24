//
//  AppStoryboard.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

/// Reference all storyboards names in the application.
/// These references are used to instantiate any view controller instance in a references storyboard.
///
/// Example:
/// ```
/// let fooViewController = FooViewController.instantiate(fromAppStoryboard: .main)
/// fooViewController is FooViewController // true
/// ```
///
/// This method is used to allow Xcode autocompletion, compilation type check and type casting to instantiate a
/// view controller manually.
enum AppStoryboard: String {
  case main = "Main"
  case customers = "CustomersStoryboard"
  
  /// The storyboard instance.
  var instance: UIStoryboard {
    return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
  }
  
  /// Instantiate the initial view controller of the storyboard.
  var initialViewController: UIViewController? {
    return self.instance.instantiateInitialViewController()
  }
  
  /// Instantiate a view controller from the storyboard, using the controller class from which if inferred the
  /// storyboard identifier of the controller.
  ///
  /// - parameter viewControllerType: The target view controller type which is used to infer the view controller
  ///     storyboard identifier. The inferred identifier is the controller class name. For example if the controller
  ///     FooViewController is requested, the inferred storyboard identifier will be "FooViewController".
  /// - parameter file: **Reserved. Should not be filled.** This parameter use swift default parameter to detect
  ///     the file name where this method is called to print a proper error message if needed.
  /// - parameter line: **Reserved. Should not be filled.** This parameter use swift default parameter to detect
  ///     the line in the file where this method is called to print a proper error message if needed.
  /// - returns: The view controller instantiated from the storyboard, or raise a fatal error is the view controller
  ///     cannot be instantiated.
  /// - seealso: `viewController(withIdentifier:)`
  func viewController<T: UIViewController>(
    withControllerType type: T.Type, file: String = #file, line: Int = #line) -> T {
    
    let storyboardId = (type as UIViewController.Type).storyboardId
    guard let scene = self.viewController(withIdentifier: storyboardId) as? T else {
      fatalError(
        "Unable to load view controller with identifier '\(storyboardId)' from storyboard " +
        "'\(self.rawValue)' in \(file)@\(line)")
    }
    
    return scene
  }
  
  /// Instantiate a view controller using its storyboard identifier.
  ///
  /// - parameter identifier: The view controller storyboard identifier.
  /// - returns: The view controller instance, or raise a fatal error if the given identifier is not found.
  /// - seealso: `viewController(withControllerType:)`
  func viewController(withIdentifier identifier: String) -> UIViewController {
    return self.instance.instantiateViewController(withIdentifier: identifier)
  }
}

