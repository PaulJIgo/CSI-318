//
//  WorldClockTableView.swift
//  ClockApp
//
//  Created by Paul Igo on 2/23/25.
//

import UIKit
import SnapKit

class WorldClockTableView: UITableViewController {
    
    var worldClockTableViewModel = WorldClockData()
    
    init() {
        super.init(style: .plain)
        tabBarItem = UITabBarItem(title: "WorldClock", image: UIImage(systemName: "globe"), tag: 0)
        tabBarItem.badgeColor = .gray
    }
    
    override func viewDidLoad() {
        title = "World Clock"
        tableView.delegate = self
        view.backgroundColor = .black
        tableView.dataSource = self
        tableView.register(WorldClockCell.self, forCellReuseIdentifier: "WorldClockCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
extension WorldClockTableView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldClockTableViewModel.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WorldClockCell") as? WorldClockCell {
            cell.configure(with: worldClockTableViewModel.data[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    
    
}
