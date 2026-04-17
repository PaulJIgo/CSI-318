//
//  WebPageCollectionViewCell.swift
//  CollectionViewWithWebKitStarterCodeForClass
//
//  Created by Paul Igo on 4/12/25.
//

import UIKit
import SnapKit

class BasicCollectionViewCell : UICollectionViewListCell {
    
    var leftLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(leftLabel)
        
        leftLabel.textColor = .systemGreen
        leftLabel.textColor = UIColor(red: 6/255, green: 25/255, blue: 113/255, alpha: 1.0)
        leftLabel.font = .systemFont(ofSize: 14)
        leftLabel.textAlignment = .left
        
        leftLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(vm: WebPageVM) {
        leftLabel.text = vm.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
