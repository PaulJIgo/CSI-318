//
//  ViewController.swift
//  WikipediaWebSearch
//
//  Created by Paul Igo on 3/25/25.
//

import UIKit
import Alamofire
import Kingfisher
import SnapKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setViewControllers([WikipediaTableViewController()], animated: true)
    }


}





