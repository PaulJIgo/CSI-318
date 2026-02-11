//
//  ViewController.swift
//  TikTokLabStarterCode
//
//  Created by Paul Igo on 2/11/26.
//

import UIKit

class HomeTabBarController: UITabBarController {

    let homeViewController = HomeScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers([homeViewController], animated: true)
    }


}

