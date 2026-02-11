//
//  ViewController.swift
//  MoreComplexDataStorage
//
//  Created by Paul Igo on 2/11/26.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let flags = getFlagData()
        
        for flag in flags {
            print(flag.name)
            print(flag.continent)
            print(flag.flag)
        }
    }
    
    func getFlagData() -> [Flag] {
        // Get the URL for our PList
        if let url = Bundle.main.url(forResource: "GameData", withExtension: "plist") {
            do {
                guard let data = try? Data(contentsOf: url) else { return [] }
                let decoder = PropertyListDecoder()
                let flagData = try decoder.decode(FlagData.self, from: data)
                
                // If we are able to get our Data out, return just the flags
                return flagData.flags
            } catch {
                // If there is an error converting the Data return nothing
                return []
            }
        } else {
            // If the URL fails return nothing
            return []
        }
    }
}

// Its very important to have : Codable below
struct FlagData: Codable { 
    var flags: [Flag]
}

// Its very important to have : Codable below
struct Flag : Codable {
    let name: String
    let flag: String
    let continent: String
}
