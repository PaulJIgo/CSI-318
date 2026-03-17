//
//  NotesCell.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/26.
//

import UIKit 
import SnapKit

class NotesCell: UITableViewCell {
    
    let titleText = UILabel()
    let authorText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleText)
        contentView.addSubview(authorText)
        
        titleText.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview() 
            make.width.equalToSuperview().dividedBy(2)
        }
        authorText.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview() 
            make.left.equalTo(titleText.snp.right)
            make.width.equalToSuperview().dividedBy(2)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(vm: Note) {
        authorText.text = vm.author
        titleText.text = vm.title
    }
    
}
