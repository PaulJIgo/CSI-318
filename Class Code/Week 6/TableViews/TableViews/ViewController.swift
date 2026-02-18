//
//  ViewController.swift
//  TableViews
//
//  Created by Paul Igo on 2/16/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var tableView = UITableView() 
    var contactsViewModel = ContactsViewModel()
    var button = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.addSubview(tableView)
        
        createButton()
        tableView.snp.makeConstraints {
            $0.top.equalTo(button.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        // Set the delegate method in case we want to override certain functions
        tableView.delegate = self
        
        // Set the dataSource (who will be giving the data to the table)
        tableView.dataSource = self
        
        // Tell the tableView what type of cells it should expect
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCellReuseIdentifier")
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
        contactsViewModel.addBlankContact()
        tableView.reloadData()
    }
    

}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contactsViewModel.objects.remove(at: indexPath.row)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    // The two functions below you MUST implement or your code wont compile
    
    // This function tells the tableview how many rows are in it
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactsViewModel.objects.count
    }

    // This function determines what type of cell will show up at each indexpath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // We want a dequeueReusableCell to save memory
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellReuseIdentifier") as? TableViewCell {
            // We can then use our viewModel to get our object
            let vm = contactsViewModel.objects[indexPath.row]
            
            // Once we get the object we can configure the cell
            cell.configure(vm: vm)
            
            // Return the configured cell to be shown
            return cell
        } else {
            // If for some reason we fail, just return a blank cell
            return UITableViewCell()
        }
    }
    
    
    
}


