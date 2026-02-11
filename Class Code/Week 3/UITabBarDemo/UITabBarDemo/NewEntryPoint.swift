//
//  NewEntryPoint.swift
//  UITabBarDemo
//
//  Created by Paul Igo on 2/4/26.
//

import UIKit

class NewEntryPoint: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewController1 = ViewController()
        let viewController2 = ViewController2()
        
        viewController1.tabBarItem = UITabBarItem(title: "VC1", image: nil, tag: 0)
        viewController2.tabBarItem = UITabBarItem(title: "VC2", image: UIImage.checkmark, tag: 1)
        
        
        setViewControllers([viewController1, viewController2], animated: true)
        
        
        print("App started")
    }
    
}
