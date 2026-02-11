//
//  HomeScreen.swift
//  InClassTabBarDemo
//
//  Created by Paul Igo on 2/9/26.
//

import SnapKit
import UIKit

class HomeScreen: UIViewController {
    
    var navigationDelegate: NavigationDelegate?
    let username = UITextField()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Setting up Icon
        let icon = UIImageView() 
        icon.image = UIImage(named: "appImage")
        view.addSubview(icon)
        icon.snp.makeConstraints { make in 
            make.width.height.equalTo(101)
            make.center.equalToSuperview()
        }

        // Setting the delegate to self allows us to override the textField properties
        username.delegate = self
        
        // SnapKit for username field
        view.addSubview(username)
        username.snp.makeConstraints { make in 
            make.top.equalTo(icon.snp.bottom) 
            make.height.equalTo(50)
            make.centerX.equalTo(icon.snp.centerX)
        }
        username.placeholder = "Username..."
        
        // Initializing UserDefaults
        let userDefaults = UserDefaults.standard
        
        // Adding a value to userDefaults
        username.text = userDefaults.string(forKey: "username")
        
        // Removing a value from userDefaults
        userDefaults.removeObject(forKey: "username")
        
        let password = UITextField() 
        password.placeholder = "Password..."
        
        // Not shown in class but we can also set the type of textfield to hide the text as it is being shown
        password.isSecureTextEntry = true
        
        // SnapKit for password field
        view.addSubview(password)
        password.snp.makeConstraints { make in
            make.top.equalTo(username.snp.bottom)
            make.height.equalTo(50)
            make.centerX.equalTo(icon.snp.centerX)
        }
        
        let loginButton = UIButton()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        loginButton.addGestureRecognizer(tapGesture)
        view.addSubview(loginButton)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalTo(icon.snp.centerX)  
            make.width.equalTo(70)
            make.top.equalTo(password.snp.bottom)
            make.height.equalTo(70)
        }
    }
    
    @objc
    func tapped() {
        navigationDelegate?.navigateToSettingsScreen()
        navigationDelegate?.setTextOfLabelInSettingsScreenToUsername(newText: username.text ?? "" )
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(username.text, forKey: "username")
        
    }
}

extension HomeScreen: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersInRanges ranges: [NSValue], replacementString string: String) -> Bool {
        
        for letter in string {
            if letter == "e" {
                return false
            }
        }
        return true
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return !(textField.text?.isEmpty ?? true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.count ?? 0 > 3 {
            textField.text = ""
        }
        
        
    }
    
}

protocol NavigationDelegate {
    func navigateToSettingsScreen() 
    func setTextOfLabelInSettingsScreenToUsername(newText: String)
}


extension Array {
     func popLastAndPrintHelloWorld() {
        print("Hello World")

    }
}
