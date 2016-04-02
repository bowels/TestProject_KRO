//
//  ViewController.swift
//  TestProject
//
//  Created by Roman Kovalchuk on 3/31/16.
//  Copyright © 2016 iceHead. All rights reserved.
//

import UIKit
import ReactiveCocoa
import Result

class LoginViewController: UIViewController {
    
    private let viewModel = LoginViewModel()

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.isLoginCompleteSignal.observeNext { [weak self] _ in
            self?.performSegueWithIdentifier("to main", sender: self)
        }
        viewModel.errorSignal.observeNext { [weak self] error in
            self?.errorLabel.text = error.localizedDescription
        }
        viewModel.isErrorHidden.producer.startWithNext { [weak self] isHidden in
            self?.errorLabel.hidden = isHidden
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.translucent = false

    }
    
    //Mark: - Actions
    
    @IBAction func didTouchLoginButton(sender: AnyObject) {
        viewModel.didTouchLoginButton(loginField.text!)
    }

    
    //Mark: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if segue.identifier == "to main" {
            let mainViewController = segue.destinationViewController as! MainViewController
            mainViewController.viewModel = viewModel.mainViewModel
        }
    }

}

