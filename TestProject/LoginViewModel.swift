//
//  LoginViewModel.swift
//  TestProject
//
//  Created by Roman Kovalchuk on 3/31/16.
//  Copyright © 2016 iceHead. All rights reserved.
//

import ReactiveCocoa
import Result

class LoginViewModel {
    
    private let model = LoginModel()

    private(set) var mainViewModel: MainViewModel?
    
    private(set) var isErrorHidden = MutableProperty<Bool>(true)
    
    private let (_isLoginCompleteSignal, _isLoginCompleteObserver) = Signal<String, NoError>.pipe()
    var isLoginCompleteSignal: Signal<String, NoError> {
        return _isLoginCompleteSignal
    }
    private let (_errorSignal, _errorObserver) = Signal<NSError, NoError>.pipe()
    var errorSignal: Signal<NSError, NoError> {
        return _errorSignal
    }
    
    init() {
        model.result.producer.filter { username in
            return username != nil
        }.producer.startWithNext { [weak self] username in
            self?.mainViewModel = MainViewModel(username!)
            self?._isLoginCompleteObserver.sendNext(username!)
        }
        model.error.producer.filter { error in
            return error != nil
            }.producer.startWithNext { [weak self] error in
            self?.sendError(error!)
        }
    }
    
    //Mark: - public
    
    func didTouchLoginButton(name: String) {
        isErrorHidden.value = true

        if strlen(name) < 4 {
            sendError(ErrorContainer.CharactersLess)
            return
        }
        
        model.logIn(name)
    }
    
    //Mark: - private

    private func sendError(error: NSError) {
        _errorObserver.sendNext(error)
       isErrorHidden.value = false
    }
}