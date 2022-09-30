//
//  ContentViewModel.swift
//  Reminders
//
//  Created by Ryo on 2022/09/30.
//

import Foundation

class ContentViewModel: ObservableObject {
    var eventManager = EventManager()
    @Published  var menu = "全て表示"
    
    
    func FetchingReminders(){
        eventManager.FetchingReminders()
    }
    
}
