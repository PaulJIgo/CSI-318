//
//  WikipediaTableViewController.swift
//  WikipediaWebSearch
//
//  Created by Paul Igo on 3/26/25.
//

import UIKit

class WikipediaTableViewController: UITableViewController {
    
    let model = WikipediaModel()
    let searchController = UISearchController()
    override func viewDidLoad() {
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        title = "Wikipedia Search"
        tableView.register(WikipediaCell.self, forCellReuseIdentifier: "WikipediaCell")
        tableView.dataSource = model
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension WikipediaTableViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        if let searchBarText = searchBar.text {
            model.getURLs(searchBarText, completion: {_ in 
                self.tableView.reloadData()
            })
        }
    }
    
}
