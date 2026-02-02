//
//  ViewController.swift
//  SnapKitDemoForWeek2DUEX
//
//  Created by Paul Igo on 1/26/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let label = UILabel() 
        label.text = "Hello World! Hello World! Hello World! Hello World! Hello World!"
        view.addSubview(label)
        
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(orangeView.snp.bottom)
            make.left.bottom.equalToSuperview()
            make.right.equalTo(greenView.snp.left)
            make.width.lessThanOrEqualToSuperview().dividedBy(2)
        }
        
        orangeView.snp.makeConstraints { make in 
            make.top.left.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.bottom.equalTo(greenView.snp.top)
        }
        
        blueView.snp.makeConstraints { makeBlueView in 
            makeBlueView.top.right.equalTo(view.safeAreaLayoutGuide)
            makeBlueView.left.equalTo(orangeView.snp.right)
            makeBlueView.bottom.equalTo(greenView.snp.top)
        }
        
        greenView.snp.makeConstraints {
            $0.bottom.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalToSuperview().dividedBy(2)
        }
        
        
        
    }


}

