//
//  Customer.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Customer {
    var firstname = ""
    var lastname = ""
    var username = ""
    var email = ""
    var emailVerified = false
    var id = ""
}

extension Customer: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        firstname       <- map["firstname"]
        lastname        <- map["lastname"]
        username        <- map["username"]
        email           <- map["email"]
        emailVerified   <- map["emailVerified"]
        id              <- map["id"]
    }
}

