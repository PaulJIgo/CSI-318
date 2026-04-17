//
//  WebPageCollectionView.swift
//  CollectionViewWithWebKitStarterCodeForClass
//
//  Created by Paul Igo on 4/12/25.
//

import UIKit

class WebPageCollectionView: UIViewController, UICollectionViewDelegate {
    
    enum Section {
        case main
        case secondary
        
        func rawValue() -> String {
            switch self {
                case .main: return "Main"
                case .secondary: return "Secondary"
            }
        }
    }
    
    var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<Section, WebPageVM>! = nil
    
    override func viewDidLoad() {
        title = "External Resources"
        
        setupHeirarchy()
        configureDataSource()
    }
    
    func setupHeirarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
    }
    
    func showFirst() {
        if let item = dataSource.itemIdentifier(for: IndexPath(row: 1, section: 0)) {
            let vc = WebViewController(webViewModel: item)
            show(vc, sender: self)
        }
    }
    
    private func configureDataSource() {
        
        // Create Datasource and cell registration here
        
        let cellRegistration = UICollectionView.CellRegistration<TextCell, WebPageVM> { (cell, indexPath, identifier) in
            // Populate the cell with our item description.
            cell.label.text = "\(identifier.title)"
            cell.contentView.backgroundColor = .white
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.label.textAlignment = .center
            cell.label.font = UIFont.preferredFont(forTextStyle: .title1)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, WebPageVM>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: WebPageVM) -> UICollectionViewCell? in
            // Return the cell.
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
        
        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, WebPageVM>()
        var items = WebPageViewModel().webPageWithVM()
        snapshot.appendSections([.main, .secondary])
        
        snapshot.appendItems([WebPageVM(title: Section.main.rawValue(), url: "")], toSection: .main)
        snapshot.appendItems(items.popLast() ?? [], toSection: .main)
        
        snapshot.appendItems([WebPageVM(title: Section.secondary.rawValue(), url: "")], toSection: .secondary)
        snapshot.appendItems(items.popLast() ?? [], toSection: .secondary)
        
        // Add this back once you have a datasource, otherwise this will crash
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.headerMode = .firstItemInSection
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    // https://stackoverflow.com/questions/24074257/how-can-i-use-uicolorfromrgb-in-swift
    func textColorForLabel() -> UIColor {
        let hex: String = "#067D71"
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

         if (cString.hasPrefix("#")) {
             cString.remove(at: cString.startIndex)
         }

         if ((cString.count) != 6) {
             return UIColor.gray
         }

         var rgbValue:UInt32 = 0
         Scanner(string: cString).scanHexInt32(&rgbValue)

         return UIColor(
             red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
             green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
             blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
             alpha: CGFloat(1.0)
         )
    }
    
}

extension WebPageCollectionView {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if let item = dataSource.itemIdentifier(for: indexPath) {
            
            let vc = WebViewController(webViewModel: item)
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}
