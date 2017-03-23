//
//  ContainerExtension.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 07/03/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//
import Swinject

extension Container {
  
  // Shared container
  // We are still looking at the best way to achieve this with Swinject
  static let sharedContainer: Container = {
    let c = Container()
    //Register Login
    c.register(LoginService.self) { _ in ApiLoginService()}
    c.register(LoginBuilder.self) { _ in LoginSwiftInjectBuilder()}
    
    //Register Customers
    c.register(CustomerService.self) { _ in ApiCustomerService()}
    c.register(CustomersBuilder.self) { _ in CustomersSwiftInjectBuilder()}
    return c
  }()
}
