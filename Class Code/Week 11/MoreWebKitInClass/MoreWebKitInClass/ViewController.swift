//
//  ViewController.swift
//  MoreWebKitInClass
//
//  Created by Paul Igo on 4/6/26.
//

import UIKit
import WebKit
import SnapKit

class ViewController: UIViewController {
    
    let webview = WKWebView()
    let progressBar = UIProgressView(progressViewStyle: .bar)
    var estimatedProgress: NSKeyValueObservation?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create our URL to load into our webview
        if let url = URL(string: "https://google.com") {
            let urlRequest = URLRequest(url: url)
            webview.load(urlRequest)
        }
        
        
        view.addSubview(webview)
        view.addSubview(progressBar)
        
        progressBar.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaInsets)
            $0.height.equalTo(10)
        }
        
        webview.snp.makeConstraints {
            $0.top.equalTo(progressBar.snp.bottom)
            $0.bottom.right.left.equalTo(view.safeAreaLayoutGuide)
        }
        
        webview.uiDelegate = self
        webview.navigationDelegate = self
        
        navigationItem.title = "Web Browser"
        
        // Add our forwards and backwards button to the top right
        navigationItem.setRightBarButtonItems(barButtonItems, animated: true)
        
        // Add our refresh button to the top left
        let refreshButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(refresh))
        navigationItem.setLeftBarButton(refreshButton, animated: true)
        
        // Create an observer to update whenever our 
        estimatedProgress = webview.observe(\.estimatedProgress, options: [.new], changeHandler: { webview, value in
            // If we don't have an value then do nothing
            guard let newValue = value.newValue else { return }
            

            if self.progressBar.progress < Float(newValue) {
                // If our progress is above what is currently on the bar, then animate it
                self.progressBar.setProgress(Float(newValue), animated: true)
            } else {
                // If our progress is BELOW the current value, don't animate it so it doesnt look like its going backwards sometimes
                self.progressBar.setProgress(Float(newValue), animated: false)
            }
            
            // If our bar is at 100% hide the progressBar
            if newValue >= 1.0 {
                self.progressBar.isHidden = true
            } else { 
                self.progressBar.isHidden = false
            }
            
            
        })
        
    }
    
    @objc 
    func refresh() {
        webview.reload()
    }
    
    // A computed variable that gets us updated bar button items
    // This makes sure our isEnabled is always set correctly
    var barButtonItems: [UIBarButtonItem] {
        
        let goForwardButton = UIBarButtonItem(image: UIImage(systemName: "chevron.forward"), style: .plain, target: self, action: #selector(goForward))
        goForwardButton.isEnabled = webview.canGoForward
        
        
        let goBackwardsButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(goBackward))
        goBackwardsButton.isEnabled = webview.canGoBack
        return [goForwardButton, goBackwardsButton]
        
    }
    
    @objc
    func goForward() {
        webview.goForward()
    }
    
    @objc
    func goBackward() {
        webview.goBack()
    }


}

extension ViewController:  WKUIDelegate, WKNavigationDelegate {
    // This function is called everytime we navigate to any screen
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        navigationItem.setRightBarButtonItems(barButtonItems, animated: true)
    }
    
}
