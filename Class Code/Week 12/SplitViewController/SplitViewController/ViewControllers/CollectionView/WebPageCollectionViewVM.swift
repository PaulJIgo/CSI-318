//
//  WebPageCollectionViewVM.swift
//  CollectionViewWithWebKitStarterCodeForClass
//
//  Created by Paul Igo on 4/12/25.
//

import UIKit

nonisolated struct WebPageVM: Hashable {
    var title: String
    var url: String
    var id = UUID()
}

class WebPageViewModel {
    var data: [[WebPageVM]] = []
    init() {
        data = webPageWithVM()
    }
    
    func webPageWithVM() -> [[WebPageVM]] {
        return [
            [WebPageVM(title: "Google", url: "https://www.google.com/"),
            WebPageVM(title: "Youtube", url: "https://www.youtube.com"),
             WebPageVM(title: "Reddit", url: "https://www.reddit.com")],
            [WebPageVM(title: "Google", url: "https://www.google.com"),
            WebPageVM(title: "Youtube", url: "https://www.youtube.com"),
            WebPageVM(title: "Reddit", url: "https://www.reddit.com")]
        ]
    }
}

