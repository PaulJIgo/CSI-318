//
//  NotesModel.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/26.
//

import Foundation
import UIKit

struct Note {
    var title: String
    var author: String
}


class NotesModel {
    var objects: [[Note]] = []
    
    init() {
        objects = createNotes()
    }
    
    func createNotes() -> [[Note]] {
        let firstSection: [Note] = [
            Note(title: "Note1", author: "Paul"),
            Note(title: "Note2", author: "Still Paul"),
            Note(title: "Note3", author: "Paul Again"),
            Note(title: "Note4", author: "Mr. Igo"),
            Note(title: "Note5", author: "Professor Paul"),
            Note(title: "Note6", author: "Paul Igo"),
            Note(title: "Note7", author: "Igo Paul"),
            ]
        let secondSection: [Note] = [
            Note(title: "Section2Note1", author: "Paul"),
            Note(title: "Section2Note2", author: "Still Paul"),
            Note(title: "Section2Note3", author: "Paul Again"),
            Note(title: "Section2Note4", author: "Mr. Igo"),
            Note(title: "Section2Note5", author: "Professor Paul"),
            Note(title: "Section2Note6", author: "Paul Igo"),
            Note(title: "Section2Note7", author: "Igo Paul"),
            ]
        
        return [firstSection, secondSection]
    }
    
    func object(for indexPath: IndexPath) -> Note? {
        return objects[indexPath.section][indexPath.row]
    }
    
    func swap(source: IndexPath, destination: IndexPath) {
        let vm = objects[source.section].remove(at: source.row)
        objects[destination.section].insert(vm, at: destination.row) 
    }
    
    func deleteObject(indexPath: IndexPath) {
        objects[indexPath.section].remove(at: indexPath.row)
    }
}
