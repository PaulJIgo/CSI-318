//
//  NavigationController.swift
//  MoreWebKitInClass
//
//  Created by Paul Igo on 4/6/26.
//

import UIKit

class RootNavigationController : UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers([ViewController()], animated: true)
    }
}

