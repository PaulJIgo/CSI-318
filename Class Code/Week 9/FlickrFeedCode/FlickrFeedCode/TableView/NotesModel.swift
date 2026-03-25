//
//  NotesApp.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/25.
//

import UIKit
import Alamofire

struct Note {
    var title: String
    var content: String
}

class NotesViewModel : NSObject {
    
    var data: FlickrFeed?

    override init() {
        super.init()
        fetchAllData(completion: nil)
    }
    
    
    func fetchAllData(completion: (() -> Void)?) {
        self.data = nil
        FlickrService().fetchFlickrFeed(completion: {
            do {
                try self.data = $0.get()
                completion?()
            } catch {
                self.data = nil
            }
        }) 
    }
}

