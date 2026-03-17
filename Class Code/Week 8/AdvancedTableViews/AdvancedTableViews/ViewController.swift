//
//  ViewController.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/26.
//

import UIKit

class NavigationController: UINavigationController {

    let tableView = NotesTableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers([tableView], animated: true)
        
        // Do any additional setup after loading the view.
    }


}

