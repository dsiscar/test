//
//  ViewProtocols.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import PKHUD

protocol ReusableView: class {}

protocol NibLoadableView: class {}

protocol LoadingView: class {
  func showLoader()
  func hideLoader()
  
  func loadingSucceed(completion: LoadingCompletion?)
  func loadingFailed(withError error: Error?, completion: LoadingCompletion?)
}
