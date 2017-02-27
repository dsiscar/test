//
//  Endpoints.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "http://it0082qp.ctr.ibp:8080/api/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Customers: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/customers/"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
