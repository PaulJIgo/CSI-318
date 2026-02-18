//
//  TableViewCell.swift
//  TableViews
//
//  Created by Paul Igo on 2/16/26.
//
import UIKit
import SnapKit


// The VIEW part of MVC
class TableViewCell: UITableViewCell {
    let stackView = UIStackView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let phoneLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add all your views in the initializer
        // Make sure to add your subview to the contentView
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(phoneLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // The configure method is what we pass our VM into to populate our view with data
    func configure(vm: Contact) {
        nameLabel.text = vm.name
        emailLabel.text = vm.email
        phoneLabel.text = vm.phoneNumber
    }
    
    
    
}
