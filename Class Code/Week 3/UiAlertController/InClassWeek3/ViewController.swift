//
//  ViewController.swift
//  InClassWeek3
//
//  Created by Paul Igo on 2/2/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    let button = UIButton()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(button)
        
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Press me!", for: .normal)
        
        button.snp.makeConstraints { make in 
            make.center.equalToSuperview()
            make.height.width.equalTo(357)
            
        }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedButton))
        
        button.addGestureRecognizer(gesture)
    }
    
    @objc
    func tappedButton() {
        
        // Create our alert Controller
        let alertController = UIAlertController(title: "Tapped!", message: "You tapped the button! Now you are soft locked", preferredStyle: .actionSheet)
        
        // Add a source view for the action sheet, if we don't add this it'll be an alert
        alertController.popoverPresentationController?.sourceView = button
        
        // Add a default action with a handler
        alertController.addAction(UIAlertAction(title: "Default", style: .default, handler: {
            self.button.setTitle($0.title, for: .normal)
        }))
        
        // Add an action with cancel style
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        // Add a destructive alert with a handler that accesses self
        alertController.addAction(UIAlertAction(title: "Delete all your data on your phone", style: .destructive, handler: { alertAction in 
            self.button.setTitle(alertAction.title, for: .normal)
        }))
        // present our alert to the user
        present(alertController, animated: true)
        
    }
    


}

