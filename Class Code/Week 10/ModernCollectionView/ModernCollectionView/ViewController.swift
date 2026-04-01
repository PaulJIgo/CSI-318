
// ModernCollectionView.swift

import UIKit

class ViewController: UIViewController {

    var dataSource: UICollectionViewDiffableDataSource<CollectionViewSection, Int>! = nil
    var collectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Grid"
        configureHierarchy()
        configureDataSource()
    }
}

extension ViewController {
    
    // This is our layout function which determines the widths, heights and positions of our cells
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let leadingItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7),
                                                   heightDimension: .fractionalHeight(1.0)))
            leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            let trailingItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalHeight(0.3)))
            trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            let trailingGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                                   heightDimension: .fractionalHeight(1.0)),
                repeatingSubitem: trailingItem,
                count: 2)
            
            let containerGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85),
                                                   heightDimension: .fractionalHeight(0.4)),
                subitems: [leadingItem, trailingGroup])
            let section = NSCollectionLayoutSection(group: containerGroup)
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        }
        return layout
        }
}

extension ViewController {
    // This creates our UICollectionView with the layout
    // THIS MUST BE CALLED FIRST OR YOU WILL CRASH
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
    }
    private func configureDataSource() {
        
        // The cell registration is our equivalent of cellForRowAt
        // It takes in a cell (TextCell), indexPath(IndexPath) and identifier (Int in this case)
        let cellRegistration = UICollectionView.CellRegistration<TextCell, Int> { (cell, indexPath, identifier) in
            // Populate the cell with our item description.
            cell.label.text = "\(identifier)"
            cell.contentView.backgroundColor = .white
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.label.textAlignment = .center
            cell.label.font = UIFont.preferredFont(forTextStyle: .title1)
        }
        
        // This creates our datasource and determines what cellRegistration to use for each index path
        // If you want to have different cell types for different sections, rows, or even a type on your potential viewModel you change that here
        dataSource = UICollectionViewDiffableDataSource<CollectionViewSection, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            // Return the cell.
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }

        // initial mock data
        var snapshot = NSDiffableDataSourceSnapshot<CollectionViewSection, Int>()
        snapshot.appendSections([CollectionViewSection.main])
        snapshot.appendItems(Array(0..<94))
        dataSource.apply(snapshot, animatingDifferences: false)
        
        // This is applying new ints to our datasource
        // Note: This will only add 95-200 because we already have objects that are 0-95
        var snapshot2 = dataSource.snapshot()
        snapshot2.appendItems(Array(5..<200))
        dataSource.apply(snapshot2, animatingDifferences: false)
    }
}

// For iOS26 this needs to be nonisolated or you will have an error on your datasource
// nonisolated just means it can be passed around on background contexts
nonisolated enum CollectionViewSection {
    case main
}

