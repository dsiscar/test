//
//  ErrorManager.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 01/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit

protocol ErrorManager {
    func manageError(_ error: Error)
}

extension ErrorManager where Self: UIViewController {
    
    func manageError(_ error: Error) {
        let alert = UIAlertController(title: "Erreur", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}