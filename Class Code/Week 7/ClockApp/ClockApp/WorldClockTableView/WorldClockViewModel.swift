//
//  WorldClockViewModel.swift
//  ClockApp
//
//  Created by Paul Igo on 2/23/25.
//

import UIKit
import Foundation

struct WorldClockCellViewModel {
    var time: Date
    var timeDifferenceLabel: String
    var location: String
}

class WorldClockData : NSObject {
    
    
    var data: [WorldClockCellViewModel] = []
    
    override init() {
        super.init()
        self.data = createData()
    }
    
    func createData() -> [WorldClockCellViewModel]{
        return [
            WorldClockCellViewModel(time: Date.now, timeDifferenceLabel: "Today, +0HRS", location: "Burlington"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(-3600*2), timeDifferenceLabel: "Today, -2HRS", location: "Phoenix"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(3600*5), timeDifferenceLabel: "Dublin, +5HRS", location: "Dublin"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(3600*6), timeDifferenceLabel: "Munich, +6HRS", location: "Munich"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(-3600*4), timeDifferenceLabel: "Anchorage, -4HRS", location: "Anchorage"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(-3600*1), timeDifferenceLabel: "Mexico City, -1HRS", location: "Mexico City"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(3600*5), timeDifferenceLabel: "London, +5HRS", location: "London"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(3600*7), timeDifferenceLabel: "Cairo, +7HRS", location: "Cairo"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(3600*8), timeDifferenceLabel: "Moscow, +8HRS", location: "Moscow"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(3600*9), timeDifferenceLabel: "Dubai, +9HRS", location: "Dubai"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(3600*12), timeDifferenceLabel: "Bangkok, +12HRS", location: "Bangkok"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(3600*13), timeDifferenceLabel: "Beijing, +13HRS", location: "Beijing"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(3600*14), timeDifferenceLabel: "Tokyo, +14HRS", location: "Tokyo"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(3600*15), timeDifferenceLabel: "Sydney, +15HRS", location: "Sydney"),
            WorldClockCellViewModel(time: Date.now.addingTimeInterval(3600*18), timeDifferenceLabel: "Auckland, +18HRS", location: "Auckland"),
            WorldClockCellViewModel(time: Date.now, timeDifferenceLabel: "Today, +0HRS", location: "Boston")
            
        ]
    }
    
}
