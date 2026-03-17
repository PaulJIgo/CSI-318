//
//  NotesTableView.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/26.
//

import UIKit

class NotesTableView: UITableViewController {
    let model = NotesModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registering our TableView to be ready for the views
        tableView.register(NotesCell.self, forCellReuseIdentifier: "NotesCell")
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(FooterView.self, forHeaderFooterViewReuseIdentifier: "FooterView")
        
        // The editing button that sets the table to isEditing
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let vm = model.object(for: indexPath),
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell") as? NotesCell
                {
            cell.configure(vm: vm)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.objects[section].count
    }

    // This is needed for two dimensional arrays
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.objects.count
    }
}

// Rearranging 
extension NotesTableView {
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        model.swap(source: sourceIndexPath, destination: destinationIndexPath)
        tableView.reloadData() 
    }
}

// Deletion 
extension NotesTableView { 
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // This allows us to use the red circle to delete objects
        if editingStyle == .delete {
            model.deleteObject(indexPath: indexPath)
            tableView.reloadData()
        }
    }
}


// Header and Footers
extension NotesTableView {
    
//    If you want a simple one you can do these two function

//    This one for Header
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Header for section: " + String(section)
//    }
    
//    This one for Footer
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "Header for section: " + String(section)
//    }

    // For a more Customized Header and Footer you can use these
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView {
            headerView.configure(title: "Section: " + String(section))
            return headerView
        }
        return UIView()
    }
    
    // For a more Customized Header and Footer you can use these
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FooterView") as? FooterView {
            footerView.configure(title: "Section: " + String(section))
            return footerView
        }
        return UIView() 
    }
}
