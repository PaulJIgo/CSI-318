//
//  ViewController.swift
//  MoreWebKit
//
//  Created by Paul Igo on 4/6/26.
//

import UIKit

class RootNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers([WebViewController(url: "https://www.google.com")], animated: true)
        

        // Do any additional setup after loading the view.
    }


}

