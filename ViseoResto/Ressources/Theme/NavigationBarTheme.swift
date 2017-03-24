//
//  NavigationBarTheme.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 03/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

enum AppTheme: String {
  case viseo
  case red
  case green
  
  static var currentTheme: AppTheme! {
    guard let themeString = AppUserDefaults.value(forKey: .currentTheme).string else {
      AppUserDefaults.save(value: "viseo", forKey: .currentTheme)
      return .viseo
    }
    return AppTheme(rawValue: themeString)
  }
  
  //Fonts
  var mainFont: UIFont {
    switch self {
    case .viseo:
      return UIFont.systemFont(ofSize: 20, weight: UIFontWeightSemibold)
    case _:
      return UIFont.systemFont(ofSize: 20, weight: UIFontWeightSemibold)
    }
  }
  
  //Colors
  var mainActionColor: UIColor {
    switch self {
    case .viseo:
      return UIColor.blueViseo
    case .red:
      return UIColor.redApp
    case .green:
      return UIColor.greenApp
    }
  }
  
  var backgroundColor: UIColor {
    return mainActionColor
  }
  
  var textColor: UIColor {
    return UIColor.white
  }
}

class AppFont {
  static var navbarText = AppTheme.currentTheme.mainFont
}

class NavigationBarTheme {
  func apply(withTheme theme: AppTheme) {
    let appearance = UINavigationBar.appearance()
    
    AppUserDefaults.save(value: theme.rawValue, forKey: .currentTheme)
    appearance.tintColor = UIColor.white
    appearance.barTintColor = AppColor.backgroundColor
    appearance.isTranslucent = false
    let font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightSemibold)
    
    appearance.titleTextAttributes = [
      NSFontAttributeName: font,
      NSForegroundColorAttributeName: UIColor.white
    ]
  }
}
