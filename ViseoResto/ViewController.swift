//
//  ViewController.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("test")
        
    }
    
    @IBAction func customersBtnAction(_ sender: Any) {
        let customerVC = CustomersRouter.assembleModule()
        self.navigationController?.pushViewController(customerVC, animated: true)
    }
    
    
}
