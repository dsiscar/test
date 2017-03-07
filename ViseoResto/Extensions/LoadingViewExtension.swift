//
//  LoadingViewExtension.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import PKHUD

typealias LoadingCompletion = (Bool) -> Void

extension LoadingView where Self: UIViewController {
  
  func showLoader() {
    HUD.dimsBackground = false
    HUD.show(.progress)
  }
  
  func hideLoader() {
    HUD.hide()
  }
  
  func loadingSucceed(completion: LoadingCompletion?) {
    HUD.flash(.success, delay: 0.5, completion: completion)
  }
  
  func loadingFailed(withError error: Error?, completion: LoadingCompletion?) {
    guard let error = error else {
      HUD.flash(.error, delay: 1.0, completion: completion)
      return
    }
    
    HUD.flash(.labeledError(
      title: "Erreur", subtitle: error.localizedDescription), delay: 1.0, completion: completion)
  }
}
