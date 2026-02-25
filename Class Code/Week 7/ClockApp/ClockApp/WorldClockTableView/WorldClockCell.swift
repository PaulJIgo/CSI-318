//
//  WorldClockCell.swift
//  ClockApp
//
//  Created by Paul Igo on 2/23/25.
//

import UIKit

class WorldClockCell: UITableViewCell {
    var timeLabel = UILabel()
    var timeDifferenceLabel = UILabel()
    var locationLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(timeLabel)
        addSubview(timeDifferenceLabel)
        addSubview(locationLabel)
        backgroundColor = .black
        
        timeLabel.backgroundColor = .black
        timeLabel.textColor = .white
        timeLabel.adjustsFontSizeToFitWidth = true
        timeLabel.textAlignment = .right
        timeLabel.minimumScaleFactor = 0.8
        timeLabel.font = .systemFont(ofSize: 64, weight: .light)
        
        timeDifferenceLabel.backgroundColor = .black
        timeDifferenceLabel.textColor = .gray
        
        locationLabel.backgroundColor = .black
        locationLabel.textColor = .white
        locationLabel.font = .systemFont(ofSize: 24, weight: .light)
        
        timeLabel.snp.makeConstraints {
            $0.top.right.bottom.equalToSuperview().inset(8)
        }
        
        locationLabel.snp.makeConstraints {
            $0.bottom.left.equalToSuperview().inset(8)
            $0.right.equalTo(timeLabel.snp.left)
        }
        
        timeDifferenceLabel.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(8)
            $0.bottom.equalTo(locationLabel.snp.top)
            $0.right.equalTo(timeLabel.snp.left)
        }
        
    }
    
    
    func configure(with viewModel: WorldClockCellViewModel) {
        timeLabel.text = viewModel.time.formatted(date: .omitted, time: .shortened)
        timeDifferenceLabel.text = viewModel.timeDifferenceLabel
        locationLabel.text = viewModel.location
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
