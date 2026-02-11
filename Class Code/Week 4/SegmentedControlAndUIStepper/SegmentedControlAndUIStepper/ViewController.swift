//
//  ViewController.swift
//  SegmentedControlAndUIStepper
//
//  Created by Paul Igo on 2/11/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // Set our segmentedControl as a class variable so we can access it everywhere
    let segmentedControl = UISegmentedControl()
    let stepperLabel = UILabel()
    let stepper = UIStepper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // SnapKit stuff
        view.addSubview(segmentedControl)
        view.addSubview(stepper)
        view.addSubview(stepperLabel)
        
        segmentedControl.snp.makeConstraints { make in 
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(24)
        }
        
        stepper.snp.makeConstraints { make in 
            make.top.equalTo(segmentedControl.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
        
        stepperLabel.snp.makeConstraints { make in 
            make.top.equalTo(stepper.snp.bottom)
            make.width.equalToSuperview() 
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
        }
        
        setupSegmentedControl()
        setupStepper()
    }
    
    func setupStepper() {
        // Add target for valueChanged
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        
        // You can overwrite the minimum and maximum values
        stepper.maximumValue = 10.0
        stepper.minimumValue = 1.0
        
        // Can also increase the step amount
        stepper.stepValue = 2.0
        
        // Allows the user to press and hold to increase
        stepper.autorepeat = true
        
        // Setup stepperLabel 
        stepperLabel.textAlignment = .center
        stepperLabel.text = String(stepper.value)

    }
    
    @objc 
    func stepperValueChanged() {
        stepperLabel.text = String(stepper.value)
    }
    
    func setupSegmentedControl() {
        // Adding Segments to our segmented control
        segmentedControl.insertSegment(withTitle: "First Segment", at: 0, animated: true)
        segmentedControl.insertSegment(with: UIImage(systemName: "flag"), at: 1, animated: true)
        
        // Insert a Segment with an Action
        segmentedControl.insertSegment(action: UIAction(title: "Action!", handler: { _ in
            print("Action")
        }), at: 2, animated: true)
        
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
    }
    
    @objc 
    func segmentedControlChanged() {
        print(segmentedControl.selectedSegmentIndex)
        
        if segmentedControl.selectedSegmentIndex == 0 {
            print("First Segment")
        } else if segmentedControl.selectedSegmentIndex == 1 {
            print("Flag")
        } else {
            print("Action Changed!!")
        }
    }

}

