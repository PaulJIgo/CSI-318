//
//  Untitled.swift
//  WikipediaWebSearch
//
//  Created by Paul Igo on 3/26/25.
//

import SnapKit
import UIKit

class WikipediaCell : UITableViewCell {
    
    let labelStack = UIStackView()
    let image = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(labelStack)
        contentView.addSubview(image)
        
        image.contentMode = .scaleAspectFit
        image.snp.makeConstraints {
            $0.bottom.top.right.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.4)
        }
        
        labelStack.axis = .vertical
        labelStack.snp.makeConstraints {
            $0.left.top.bottom.equalToSuperview()
            $0.right.equalTo(image.snp.left)
            $0.width.equalToSuperview().multipliedBy(0.6)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Update this Configure method to take in the right view model type
    func configure(vm: Image) {
        labelStack.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        // Put whatever data you'd want in the labels for the stackview here
        let labelData: [String] = [vm.name, vm.title]
        
        for data in labelData {
            let label = UILabel()
            label.text = data
            label.adjustsFontSizeToFitWidth = true
            label.numberOfLines = 0
            labelStack.addArrangedSubview(label)
            
        }
        if let url = URL(string: vm.url) {
            image.kf.setImage(with: url)
        }
        
        // Add the Image using Kingfisher
    }
    
}
