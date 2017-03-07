//
//  RootRouter.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
  func presentLoginScreen(in window: UIWindow) {
    window.makeKeyAndVisible()
    window.rootViewController = LoginRouter.assembleModule()
  }
}
