//
//  StringExtension.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 13/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

extension String {
  var isValidEmail: Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: self)
  }
}
