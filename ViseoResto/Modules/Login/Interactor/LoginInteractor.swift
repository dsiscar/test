//
//  LoginInteractor.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 01/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift

class LoginInteractor: LoginUseCase {
    
    internal func loginUser(_ username: String, password: String) -> Observable<Any> {
        return CustomerApiService.login(loginName: username, password: password)
    }

}
