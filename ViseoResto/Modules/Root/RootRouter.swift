//
//  RootRouter.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 23/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit
import Swinject

///This is the root Router, called by the AppDelegate
///His bootstrap will determine witch controller start first
class RootRouter: RootWireframe {
  
  func bootstrap(onWindow window: UIWindow) {
    guard let rootVc = self.loginModuleBuilder()?.buildLoginModule() else {
      print("Could not build root ViewController")
      return
    }
    self.showRootViewController(rootVc, inWindow: window, useNavigation: false)
  }
  
  fileprivate func loginModuleBuilder() -> LoginBuilder? {
    return Container.sharedContainer.resolve(LoginBuilder.self)
  }
}
