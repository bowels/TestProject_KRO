//
//  MainViewController.swift
//  TestProject
//
//  Created by Roman Kovalchuk on 3/31/16.
//  Copyright © 2016 iceHead. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBarHidden = false
        
        let navigationBar = navigationController!.navigationBar
        navigationBar.translucent = false
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = UIColor.grayColor()
        
        let backButton = UIBarButtonItem(
            image: UIImage(named: ""),
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: #selector(MainViewController.didPressOnLogOut))
        backButton.title = "Log Out"
        navigationItem.leftBarButtonItem = backButton
        
        let titleLabel = UILabel()
        titleLabel.text = "Hi, \(viewModel.username)"
        titleLabel.textColor = UIColor.darkGrayColor()
        titleLabel.font = UIFont(name: "OpenSans-Bold", size: 14)
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel

    }
    
    //Mark: - Navigation

    func didPressOnLogOut() {
        navigationController?.popViewControllerAnimated(true)
    }
}