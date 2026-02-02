//
//  ViewController.swift
//  ImageViewDemoWeek2
//
//  Created by Paul Igo on 1/26/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        
        imageView.image = UIImage(named: "sadKirby")
        imageView.contentMode = .scaleAspectFill
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedKirby))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        
        imageView.snp.makeConstraints { make in 
            make.edges.equalToSuperview()    
        }
    }
    
    @objc
    func tappedKirby() {
        if imageView.image == UIImage(named: "sadKirby") {
            imageView.image = UIImage(named: "happyKirby")
        } else {
            imageView.image = UIImage(named: "sadKirby")
        }
        print("tapped!")
    }


}

