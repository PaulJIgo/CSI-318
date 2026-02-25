//
//  LabelViewController.swift
//  ClockApp
//
//  Created by Paul Igo on 2/23/26.
//

import UIKit
import SnapKit

class LabelViewController: UIViewController {
    
    var labelText: String
    var label = UILabel()
    
    init(labelText: String) {
        self.labelText = labelText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        let button = UIButton()
        view.addSubview(button)
        button.titleLabel?.numberOfLines = 2
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Wahoo \n Wahoo2", for: .normal)
        button.snp.makeConstraints { make in 
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.edges.equalToSuperview()
        }
        
        label.text = labelText
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        label.addGestureRecognizer(gesture)
        label.isUserInteractionEnabled = true
        
    }
    
    @objc
    func labelTapped() {
        
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
        print("Tapped!")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
