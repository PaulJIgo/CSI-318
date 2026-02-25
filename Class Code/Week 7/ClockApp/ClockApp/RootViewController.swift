//
//  ViewController.swift
//  ClockApp
//
//  Created by Paul Igo on 2/23/25.
//

import UIKit


class RootViewController: UITabBarController {

    var worldClockTableView = WorldClockTableView()
    var alarmClockTableView = AlarmClockTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .black
        tabBar.backgroundColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .white
        let navController1 = UINavigationController(rootViewController: worldClockTableView)
        let navController2 = UINavigationController(rootViewController: alarmClockTableView)
        
        setViewControllers([navController1, navController2], animated: false)
    }


}

