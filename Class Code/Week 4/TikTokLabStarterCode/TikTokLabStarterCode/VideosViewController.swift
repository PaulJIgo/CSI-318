//
//  VideosViewController.swift
//  TikTokLabStarterCode
//
//  Created by Paul Igo on 2/11/26.
//

import UIKit
import SnapKit


class VideosViewController: UIViewController {
    
    
    var navigationDelegate: NavigationDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        tabBarItem = UITabBarItem(title: "Videos", image: UIImage(systemName: "play"), tag: 1)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let alert = UIAlertController(title: "Sorry TikTok is banned", message: "Open terms to see why I guess", preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Open Terms", style: .default, handler: { _ in 
            self.navigationDelegate?.termsTapped()
            
            
        }))
        alert.addAction(UIAlertAction(title: "Close App", style: .destructive))
        
        present(alert, animated: true)
    }
    
}

