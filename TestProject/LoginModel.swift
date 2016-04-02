//
//  LoginModel.swift
//  TestProject
//
//  Created by Roman Kovalchuk on 3/31/16.
//  Copyright © 2016 iceHead. All rights reserved.
//

import ReactiveCocoa

class LoginModel {
    
    private let _result = MutableProperty<String?>(nil)
    var result: AnyProperty<String?> {
        return AnyProperty(_result)
    }
    
    private let _error = MutableProperty<NSError?>(nil)
    var error: AnyProperty<NSError?> {
        return AnyProperty(_error)
    }

    func logIn(name: String) {
        // Handle some data from server
        if true {
          _result.value = name
        } else {
          _error.value = ErrorContainer.ServerNotFound
        }
    }
}
