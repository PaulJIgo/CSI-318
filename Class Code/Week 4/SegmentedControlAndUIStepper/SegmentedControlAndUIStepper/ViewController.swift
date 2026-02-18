//
//  ViewController.swift
//  SegmentedControlAndUIStepper
//
//  Created by Paul Igo on 2/11/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // Set our segmentedControl as a class variable so we can access it everywhere
    let segmentedControl = UISegmentedControl()
    let stepperLabel = UILabel()
    let stepper = UIStepper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // SnapKit stuff
        view.addSubview(segmentedControl)
        view.addSubview(stepper)
        view.addSubview(stepperLabel)
        
        segmentedControl.snp.makeConstraints { make in 
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(24)
        }
        
        stepper.snp.makeConstraints { make in 
            make.top.equalTo(segmentedControl.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
        
        stepperLabel.snp.makeConstraints { make in 
            make.top.equalTo(stepper.snp.bottom)
            make.width.equalToSuperview() 
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
        }
        
        let countryInfos = getFlagData()
        
        for countryInfo in countryInfos {
            print(countryInfo.name)
            print(countryInfo.flagImage)
            print(countryInfo.population)
        }
        
    }
    
    func getFlagData() -> [CountryInfo] {
        if let url = Bundle.main.url(forResource: "GameData", withExtension: "plist") {
            do {
                let data = try! Data(contentsOf: url)
                let decoder = PropertyListDecoder()
                
                let flagData = try decoder.decode(FlagData.self, from: data)
                return flagData.countryData
                
                
                
            } catch { 
                return []
            }
        }
        return []
    }

}


struct FlagData: Codable {
    var countryData: [CountryInfo]
}

struct CountryInfo : Codable {
    var flagImage: String
    var name: String
    var population: Int
}

