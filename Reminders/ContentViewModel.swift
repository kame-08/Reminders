//
//  ContentViewModel.swift
//  Reminders
//
//  Created by Ryo on 2022/09/30.
//

import Foundation
import EventKit

class ContentViewModel: ObservableObject {
//    @Published
    var eventManager = EventManager()
    @Published var menu = "全て"
    @Published var data:[EKReminder] = []
    
    func FetchingReminders(){
        data = eventManager.FetchingReminders()
        //print(eventManager.FetchingReminders())
    }
    
}
