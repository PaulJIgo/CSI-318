//
//  ViewController.swift
//  TikTokLabStarterCode
//
//  Created by Paul Igo on 2/11/26.
//

import UIKit

class HomeTabBarController: UITabBarController, NavigationDelegate {
    func loginTapped() {
        selectedIndex = 1
    }
    
    func termsTapped() {
        selectedIndex = 2
    }
    
    let homeViewController = HomeScreen()
    let termsView = TermsAndConditionsViewController()
    let videosViewController = VideosViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewController.navigationDelegate = self
        videosViewController.navigationDelegate = self
        
        setViewControllers([homeViewController,  videosViewController, termsView], animated: true)
    }


}

protocol NavigationDelegate {
    func loginTapped() 
    func termsTapped() 
    
    
}


