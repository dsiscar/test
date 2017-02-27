//
//  CustomersInteractor.swift
//  ViseoResto
//
//  Created by SISCAR David (i-BP - CONSULTIME) on 27/02/2017.
//  Copyright © 2017 Viseo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift

class CustomersInteractor: CustomersUseCase {
    
    weak var output: CustomersInteractorOutput!
    private var disposeBag = DisposeBag()
    
    func fetchCustomers() {
        CustomerApiService
            .fetchCustomers()
            .subscribe(
                onNext: { customers in
                    self.output.customersFetched(customers)
            },
                onError: { error in
                    self.output.customersFetchFailed()
            }
            )
            .addDisposableTo(disposeBag)
    }
}
