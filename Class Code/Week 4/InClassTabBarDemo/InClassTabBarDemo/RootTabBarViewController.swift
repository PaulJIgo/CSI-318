//
//  ViewController.swift
//  InClassTabBarDemo
//
//  Created by Paul Igo on 2/9/26.
//

import UIKit
import SnapKit

class RootTabBarViewController: UITabBarController {
    
    let homeScreen = HomeScreen()
    let settingsScreen = SettingsScreen() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        homeScreen.tabBarItem = UITabBarItem(title: "Home", image: .checkmark, tag: 0)

        // Tell the home screen that we can navigate via the RootTabBarViewController
        homeScreen.navigationDelegate = self
        
        settingsScreen.tabBarItem = UITabBarItem(title: "Settings", image: .add, tag: 1)
        setViewControllers([homeScreen, settingsScreen], animated: true)
    }
}

extension RootTabBarViewController: NavigationDelegate {
    
    func setTextOfLabelInSettingsScreenToUsername(newText: String) {
        settingsScreen.updateText(nextText: newText)
    }
    
    func navigateToSettingsScreen() {
        print("On the root tab bar")
        
        // Setting the selectedIndex on a RootTabBarViewController 
        selectedIndex = 1
    }
}
