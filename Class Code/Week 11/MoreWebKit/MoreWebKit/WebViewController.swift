//
//  WebViewController.swift
//  MoreWebKit
//
//  Created by Paul Igo on 4/6/26.
//

import UIKit
import WebKit
import SnapKit

class WebViewController : UIViewController {
    
    var url: URL?
    var webView = WKWebView()
    var progressView = UIProgressView()
    var estimatedProgression: NSKeyValueObservation?
    
    init(url: String) {
        self.url = URL(string: url)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    var barButtonItems: [UIBarButtonItem] {
        let barButton1 = UIBarButtonItem(image: UIImage(systemName: "chevron.forward"), style: .plain, target: self, action: #selector(goForward))
        barButton1.isEnabled = webView.canGoForward
        
        let barButton2 = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(goBackwards))
        barButton2.isEnabled = webView.canGoBack
        
        return [barButton1, barButton2]
    }
    
    @objc 
    func goForward() {
        webView.goForward()
    }
    
    @objc 
    func goBackwards() {
        webView.goBack()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        view.addSubview(progressView)
        webView.navigationDelegate = self
        
        progressView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(4)
            $0.width.equalToSuperview()
        }
        
        webView.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom)
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        estimatedProgression = webView.observe(\.estimatedProgress, options: [.new], changeHandler: { webView,value in 
            
            guard let newProgress = value.newValue else { return }
            
            
            if Float(newProgress) > self.progressView.progress {
                self.progressView.setProgress(Float(newProgress), animated: true)
            } else {
                self.progressView.setProgress(Float(newProgress), animated: false)
            }
            
            
            
        })

        
        if let url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        navigationItem.setRightBarButtonItems(barButtonItems, animated: true)
       
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        navigationItem.setRightBarButtonItems(barButtonItems, animated: true)
    }
    
    
}
