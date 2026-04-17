//
//  ViewController.swift
//  CollectionViewWithWebKitStarterCodeForClass
//
//  Created by Paul Igo on 4/12/25.
//

import UIKit

class BaseNavigationController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let primaryVC = WebPageCollectionView()

        let primaryVM = WebPageVM(title: "", url: "https://www.facebook.com")
        let detailVC = WebViewController(webViewModel: primaryVM)

        setViewController(primaryVC, for: .primary)
        setViewController(detailVC, for: .secondary)
        //setViewController(UIViewController(), for: .supplementary)
    }
}
