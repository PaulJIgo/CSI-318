//
//  NavigationController.swift
//  TableViews
//
//  Created by Paul Igo on 3/16/26.
//

import UIKit


class BaseNavgiationController: UINavigationController {
    var vc = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([vc], animated: true)
    }
    
    
    
}
