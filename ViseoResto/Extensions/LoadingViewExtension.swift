//
//  LoadingViewExtension.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import PKHUD

extension LoadingView where Self: UIViewController {
    
    func showLoader() {
        HUD.show(.progress)
    }
    
    func hideLoader() {
        HUD.hide()
    }
}
