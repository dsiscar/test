//
//  RootProtocols.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

/// Specific wireframe that provide the root view controller of the application.
protocol RootWireframe {
  func bootstrap(onWindow window: UIWindow)
}

extension RootWireframe {
  /// Present a given view controller on the given window.
  ///
  /// - parameter controller: The controller used of the root controller of the application.
  /// - parameter window: The main app window that is used to display the full application.
  /// - parameter useNavigation: If `true` then the given controller <controller> will be wrapped inside a
  ///     navigation controller before injected in the window.
  func showRootViewController(_ controller: UIViewController, inWindow window: UIWindow, useNavigation: Bool = true) {
    if useNavigation {
      self.buildNavigationHierarchy(withController: controller, inWindow: window)
    }
    else {
      self.buildHierarchy(withController: controller, inWindow: window)
    }
  }
  
  /// Build the view hierarchy without navigation controller and display it inside the window.
  ///
  /// - parameter controller: The root view controller.
  /// - parameter window: The main application window.
  private func buildHierarchy(withController controller: UIViewController, inWindow window: UIWindow) {
    window.rootViewController = controller
    window.makeKeyAndVisible()
  }
  
  /// Build the view hierarchy with a navigation controller and display it inside the window.
  ///
  /// - parameter controller: The root view controller.
  /// - parameter window: The main application window.
  private func buildNavigationHierarchy(withController controller: UIViewController, inWindow window: UIWindow) {
    let navigation = UINavigationController(rootViewController: controller)
    
    window.rootViewController = navigation
    window.makeKeyAndVisible()
  }
}
