//
//  WebViewController.swift
//  CollectionViewWithWebKitStarterCodeForClass
//
//  Created by Paul Igo on 4/12/25.
//

import UIKit
import SnapKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var vm: WebPageVM
    var webView = WKWebView()
    var progressView = UIProgressView()
    
    init(webViewModel: WebPageVM){
        self.vm = webViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        view.addSubview(webView)
        view.addSubview(progressView)
        
        title = vm.title.capitalized

        progressView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
        }

        webView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        view.backgroundColor = .white
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        if let url = URL(string: vm.url) {
            webView.load(URLRequest(url: url))
        }
        
    }
    
}
