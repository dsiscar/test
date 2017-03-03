//
//  NavigationBarTheme.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 03/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

class NavigationBarTheme {
    func apply() {
        let appearance = UINavigationBar.appearance()
        
        appearance.tintColor = UIColor.white
        appearance.barTintColor = UIColor.blueViseo
        appearance.isTranslucent = false
        let font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightSemibold)
        
        appearance.titleTextAttributes = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: UIColor.white
        ]
    }
}
