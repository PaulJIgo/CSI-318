//
//  AlarmClockCell.swift
//  ClockApp
//
//  Created by Paul Igo on 2/24/25.
//

import UIKit

class AlarmClockCell: UITableViewCell {
    var alarmSwitch = UISwitch()
    var alarmTitle = UILabel()
    var alarmTime = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(alarmSwitch)
        contentView.addSubview(alarmTitle)
        contentView.addSubview(alarmTime)
        backgroundColor = .black

        
        alarmTitle.backgroundColor = .black
        alarmTitle.textColor = .gray
        alarmTitle.font = .systemFont(ofSize: 24, weight: .light)
        
        alarmTime.backgroundColor = .black
        alarmTime.textColor = .white
        alarmTime.font = .systemFont(ofSize: 48, weight: .light)
        
        alarmSwitch.snp.makeConstraints {
            $0.top.right.bottom.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
        
        alarmTime.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(8)
            $0.height.equalTo(48)
            $0.right.equalTo(alarmSwitch.snp.left)
            $0.bottom.equalTo(alarmTime.snp.top)
        }
        
        alarmTitle.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.bottom.left.equalToSuperview().inset(8)
            $0.top.equalTo(alarmTime.snp.bottom)
            $0.right.equalTo(alarmSwitch.snp.left)
        }
        
    }
    
    
    func configure(with viewModel: AlarmClockViewModel) {
        alarmTime.text = viewModel.time.formatted(date: .omitted, time: .shortened)
        alarmSwitch.isOn = viewModel.switchIsOn
        alarmTitle.text = viewModel.title ?? "Alarm"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
