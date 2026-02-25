//
//  AlarmClockViewModel.swift
//  ClockApp
//
//  Created by Paul Igo on 2/24/25.
//

import Foundation

struct AlarmClockViewModel {
    var time: Date
    var title: String?
    var switchIsOn: Bool
}

class AlarmClockViewModelClass : NSObject {
    
    var data: [AlarmClockViewModel] = []
    var shouldShowEnglish: Bool = false
    
    override init() {
        super.init()
        self.data = createData()
    }
    
    func createData() -> [AlarmClockViewModel]{
        return [
            AlarmClockViewModel(time: Date.now, title: nil, switchIsOn: true),
            AlarmClockViewModel(time: Date.now.addingTimeInterval(1800), title: "Alarm", switchIsOn: true),
            AlarmClockViewModel(time: Date.now.addingTimeInterval(3600*16), title: "Wake up!", switchIsOn: true),
            AlarmClockViewModel(time: Date.now.addingTimeInterval(3600*4), title: "Go to bed!", switchIsOn: false),
            AlarmClockViewModel(time: Date.now.addingTimeInterval(3200 * -4), title: "Eat some lunch!", switchIsOn: true),
            AlarmClockViewModel(time: Date.now.addingTimeInterval(3600 * -4), title: "Stop eating lunch", switchIsOn: true),
            AlarmClockViewModel(time: Date.now.addingTimeInterval(3600*10), title: "Oh boy 3AM", switchIsOn: false),
            AlarmClockViewModel(time: Date.now, title: nil, switchIsOn: false),
            AlarmClockViewModel(time: Date.now, title: nil, switchIsOn: true),
            AlarmClockViewModel(time: Date.now, title: nil, switchIsOn: true),
            AlarmClockViewModel(time: Date.now, title: nil, switchIsOn: true)
            ]
    }
    
    func toggleSwitch(at indexPath: IndexPath) {
        data[indexPath.row].switchIsOn.toggle()
    }
    
    func turnAllSwitches(isOn: Bool) {
        var tempData: [AlarmClockViewModel] = []
        
        for vm in data {
            var newVM = vm
            newVM.switchIsOn = isOn
            tempData.append(newVM)
        }
        
        data = tempData
        
    }
    

}
