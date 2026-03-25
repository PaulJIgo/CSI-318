//
//  TableView.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/25.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {
    
    let viewModel = NotesViewModel()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(FeedItemTableViewCell.self, forCellReuseIdentifier: "FeedItemTableViewCell")
        
        let barButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refreshData))
        
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
    
    @objc
    func refreshData() {
        print("tapped refresh data")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FeedItemTableViewCell") as? FeedItemTableViewCell {
            cell.configure(note: "Blank Data")
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
}
