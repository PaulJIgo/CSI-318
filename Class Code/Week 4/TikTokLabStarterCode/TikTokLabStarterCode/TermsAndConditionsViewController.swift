//
//  TermsAndConditionsViewController.swift
//  TikTokLabStarterCode
//
//  Created by Paul Igo on 2/11/26.
//

import UIKit
import SnapKit
import WebKit

class TermsAndConditionsViewController: UIViewController {
    
    let webView = WKWebView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Terms and Conditions", image: UIImage(systemName: "scroll"), tag: 1)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        
        webView.snp.makeConstraints { make in 
            make.edges.equalToSuperview()    
        }
        
        if let url = URL(string: "https://google.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        
        
    }
    
    
    
    
    
}
