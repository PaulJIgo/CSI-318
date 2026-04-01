//
//  ViewController.swift
//  TableViews
//
//  Created by Paul Igo on 2/16/26.
//

import UIKit
import SnapKit
import MapKit

class ViewController: UITableViewController {

    var contactsViewModel = ContactsViewModel()
    var button = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        createButton()
        // Set the delegate method in case we want to override certain functions
        tableView.delegate = self
        
        // Set the dataSource (who will be giving the data to the table)
        tableView.dataSource = self
        
        // Tell the tableView what type of cells it should expect
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCellReuseIdentifier")
        tableView.register(HeaderViewForTableView.self, forHeaderFooterViewReuseIdentifier: "HeaderViewForTableView")
        
        tableView.dragInteractionEnabled = true
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func createButton() {
        
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        } 
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        

        
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonTapped)))
    }
    
    @objc
    func buttonTapped() {
        tableView.reloadData()
    }
    

}


extension ViewController {
    
    // The two functions below you MUST implement or your code wont compile
    
    // This function tells the tableview how many rows are in it
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vmSection = contactsViewModel.objects[section]
        print(vmSection)
        
        return vmSection.count
        
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let vm = contactsViewModel.objects[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        
        contactsViewModel.objects[destinationIndexPath.section].insert(vm, at: destinationIndexPath.row)
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            var section = contactsViewModel.objects[indexPath.section]
            section.remove(at: indexPath.row)
            contactsViewModel.objects[indexPath.section] = section
            contactsViewModel.saveContactOrder()
            tableView.reloadData()
            
            
            
            
        }
        
    }

    // This function determines what type of cell will show up at each indexpath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // We want a dequeueReusableCell to save memory
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellReuseIdentifier") as? TableViewCell {
            // We can then use our viewModel to get our object
            
            let section = contactsViewModel.objects[indexPath.section]
            let vm = section[indexPath.row]
            
            // Once we get the object we can configure the cell
            cell.configure(vm: vm)
            
            // Return the configured cell to be shown
            return cell
        } else {
            // If for some reason we fail, just return a blank cell
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        contactsViewModel.objects.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "The First people who volunteered"
//        } else {
//            return "The people I made volunteer"
//        }
//        
//    }
//    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderViewForTableView()
        if section == 0 {
            headerView.configure(title: "Section is: " + String(section))
        } else {
            headerView.configure(title: "Bottom Section is: " + String(section))
        }
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = HeaderViewForTableView()
        headerView.backgroundColor = .red
        if section == 0 {
            headerView.configure(title: "Section is: " + String(section))
        } else {
            headerView.configure(title: "Bottom Section is: " + String(section))
        }
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Bottom of Section 0"
        } else {
            return "Bottom of Section 1"
        }
    }
    
    
    
}


