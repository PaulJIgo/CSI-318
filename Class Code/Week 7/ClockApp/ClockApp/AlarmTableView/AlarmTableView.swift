//
//  AlarmTableView.swift
//  ClockApp
//
//  Created by Paul Igo on 2/23/25.
//
import UIKit

class AlarmClockTableView: UITableViewController {
    
    var clockVM = AlarmClockViewModelClass()
    
    init() {
        super.init(style: .plain)
        tabBarItem = UITabBarItem(title: "Alarm", image: UIImage(systemName: "alarm.fill"), tag: 0)
    }
    
    override func viewDidLoad() {
        //title = "Alarm Clock"
        
        let label = UILabel()
        label.text = "Alarm Clock"
        label.textColor = .red
        
        
        
        
        navigationItem.titleView = label
        
        let rightBarButtonItem = UIBarButtonItem(title: "All on", style: .plain, target: self, action: #selector(allOnTapped))
        let allOffButtonItem = UIBarButtonItem(title: "All off", style: .plain, target: self, action: #selector(allOffTapped))
        
        navigationItem.setRightBarButtonItems([rightBarButtonItem, allOffButtonItem], animated: true)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        
        view.backgroundColor = .black
        tableView.register(AlarmClockCell.self, forCellReuseIdentifier: "AlarmClockCell")
    }
    
    @objc
    func allOnTapped() {
        clockVM.turnAllSwitches(isOn: true)
        tableView.reloadData()
        

    }
    
    @objc
    func allOffTapped() {
        clockVM.turnAllSwitches(isOn: false)
        tableView.reloadData()
        print("All off Tapped")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension AlarmClockTableView {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        clockVM.toggleSwitch(at: indexPath)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        let vm = clockVM.data[indexPath.row]
        
        let labelViewController = LabelViewController(labelText: vm.title ?? "Blank Text")
        
        navigationController?.present(labelViewController, animated: true)
        
    }
    
}

extension AlarmClockTableView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clockVM.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmClockCell") as? AlarmClockCell {
            cell.selectionStyle = .none
            cell.configure(with: clockVM.data[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
