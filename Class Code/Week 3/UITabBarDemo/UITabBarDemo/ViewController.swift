//
//  ViewController.swift
//  UITabBarDemo
//
//  Created by Paul Igo on 2/4/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let label = UILabel() 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.text = "View Controller 1"
        label.textAlignment = .center
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }


}

