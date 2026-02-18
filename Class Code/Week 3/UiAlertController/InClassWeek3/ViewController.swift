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
        let alertController = UIAlertController(title: "Tapped!", message: "You tapped the button! Now you are soft locked", preferredStyle: .actionSheet)
        
        alertController.popoverPresentationController?.sourceView = button
        
        alertController.addAction(UIAlertAction(title: "Default", style: .default, handler: {
            self.button.setTitle($0.title, for: .normal)
        }
                                               
                                               ))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alertController.addAction(UIAlertAction(title: "Delete all your data on your phone", style: .destructive, handler: { alertAction in 
            self.button.setTitle(alertAction.title, for: .normal)
        }))
        
        
        
        present(alertController, animated: true)
        
    }
    


}

