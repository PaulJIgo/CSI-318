//
//  HomeScreen.swift
//  TikTokLabStarterCode
//
//  Created by Paul Igo on 2/11/26.
//

import Foundation
import UIKit
import SnapKit

class HomeScreen: UIViewController {
    
    var appImage = UIImageView()
    var userNameField = UITextField()
    var passwordField = UITextField()
    var loginButton = UIButton()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        view.addSubview(appImage)
        view.addSubview(userNameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        
        appImage.image = UIImage(named: "tiktok")
        
        userNameField.borderStyle = .roundedRect
        userNameField.placeholder = "Username..."
        
        passwordField.borderStyle = .roundedRect
        passwordField.placeholder = "Password..."
        passwordField.isSecureTextEntry = true
        
        appImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(150)
        }
        
        userNameField.snp.makeConstraints { make in
            make.top.equalTo(appImage.snp.bottom)
            make.height.equalTo(50)
            make.width.equalToSuperview().dividedBy(4)
            make.centerX.equalToSuperview()
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(userNameField.snp.bottom)
            make.height.equalTo(50)
            make.width.equalToSuperview().dividedBy(4)
            make.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalToSuperview().dividedBy(4)
            make.top.equalTo(passwordField.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.borderWidth = 1.0
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(loginButtonTapped))
        loginButton.addGestureRecognizer(gesture)
    }
    
    @objc 
    func loginButtonTapped() {
        // Set up a protocol to navigate to the "Videos Screen"
    }
    
}
