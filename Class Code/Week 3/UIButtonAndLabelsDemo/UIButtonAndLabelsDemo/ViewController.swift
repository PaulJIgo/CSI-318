//
//  ViewController.swift
//  UIButtonAndLabelsDemo
//
//  Created by Paul Igo on 2/2/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let bottomLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Commented Out Functions to mess around with
        //createARoundedRectangleButton()
        //addingAnImageToAButton()
        addingAGestureToAButton()
    }
    
    
    func addingAGestureToAButton() {
        let pressMeButton = UIButton()
        
        // Set Title and Color
        pressMeButton.setTitle("Press Me!", for: .normal)
        pressMeButton.setTitleColor(.black, for: .normal)
        
        // Add the view to our subview
        view.addSubview(pressMeButton)
        pressMeButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(4)
        }
        
        /* Some notes: 
         The target is who is in charge or responding to the gesture (almost always self)
         The action is what function happens when you tap on a button
         The action function NEEDS to be an @objc function
         You also need to wrap the buttonTapped in a #selector
         Lastly, you're passing in buttonTapped NOT buttonTapped() 
         */
        let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        pressMeButton.addGestureRecognizer(gesture)
        
        
        // You can also have a button pass itself into a function
        let changeTextButton = UIButton()
        changeTextButton.setTitle("Change Text to this!", for: .normal)
        changeTextButton.setTitleColor(.black, for: .normal)
        

        
        // Add button to view and setup constraints
        view.addSubview(changeTextButton)
        changeTextButton.snp.makeConstraints { make in
            make.top.equalTo(pressMeButton.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(3)
        }
        
        // Lets add our label we set as a class variable
        view.addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(changeTextButton.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(12)
        }
        
        // We can set the text alignment to the center
        bottomLabel.textAlignment = .center
        // This makes it if our text is too long it'll autoresize to fit
        bottomLabel.adjustsFontSizeToFitWidth = true
        bottomLabel.text = "Default Text"
        
        // If we add a _ gesture: UITapGestureRecognizer to the parameters in our function we can access it in the function
        let changeTextButtonGesture = UITapGestureRecognizer(target: self, action: #selector(passButtonIntoFunction))
        changeTextButton.addGestureRecognizer(changeTextButtonGesture)
    }
    
    @objc
    func passButtonIntoFunction(_ gesture: UITapGestureRecognizer) {
        if let buttonPassedIn = gesture.view as? UIButton {
            let text = buttonPassedIn.titleLabel?.text ?? ""
            print(text)
            bottomLabel.text = text
            // We can also disable the button if we'd like after tapping it
            buttonPassedIn.isEnabled = false
        }
    }
    
    @objc
    func buttonTapped() {
        print("Button Tapped!")
    }
    
    func addingAnImageToAButton() {
        let button = UIButton()
        
        // You can also just use .setImage but .setBackgroundImage takes up the whole constraints
        button.setBackgroundImage(.add, for: .normal)
        
        // You can also set the contentMode on these
        button.imageView?.contentMode = .scaleAspectFit
        
        // We still need to add this to our subview and set up Snapkit constraints
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2)
        }
        
    }
    
    func createARoundedRectangleButton() {
        // Syntax for creating a Button
        let button = UIButton()
        
        // We still need to add this to our subview and set up Snapkit constraints
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(16)
        }
        
        // If we want to add a title we can use the method .setTitle on UIButtons
        button.setTitle("Press me!", for: .normal)
        
        // Weirdly enough, the default color for text is white for buttons? So we also need to set the color
        button.setTitleColor(.black, for: .normal)
        
        // If we want to add an outline to this we can use the .layer property to set these
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        
        // If we want to round the corners we can use the .cornerRadius in the .layer Property
        button.layer.cornerRadius = 10
    }


}

