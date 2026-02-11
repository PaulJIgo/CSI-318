//
//  SettingsScreen.swift
//  InClassTabBarDemo
//
//  Created by Paul Igo on 2/9/26.
//

import UIKit
import SnapKit

class SettingsScreen: UIViewController {
    
    let label = UILabel() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Hello World"
        label.textAlignment = .center
        view.addSubview(label)
        
        label.snp.makeConstraints { make in 
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
    }
    
    func updateText(nextText: String) {
        label.text = nextText
    }
}
