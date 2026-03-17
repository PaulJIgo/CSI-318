//
//  HeaderAndFooterViews.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/26.
//

import UIKit
import SnapKit

class HeaderView: UITableViewHeaderFooterView {
    
    let label = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.backgroundColor = .green
        label.snp.makeConstraints { make in 
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        label.text = title
    }
    
}


class FooterView: UITableViewHeaderFooterView {
    let label = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.backgroundColor = .orange
        
        label.snp.makeConstraints { make in 
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        label.text = title
    }
    
    
}
