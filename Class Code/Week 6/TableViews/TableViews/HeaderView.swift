//
//  HeaderView.swift
//  TableViews
//
//  Created by Paul Igo on 3/16/26.
//
import UIKit
import SnapKit

class HeaderViewForTableView: UITableViewHeaderFooterView {
    
    let label = UILabel()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        label.backgroundColor = .green
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String?) {
        label.text = title
    }
    
    
}

