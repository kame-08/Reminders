//
//  EventManager.swift
//  Reminders
//
//  Created by Ryo on 2022/09/30.
//

import Foundation
import EventKit

class EventManager {
    
    // ストアの初期化を行う。
    var store = EKEventStore()
    
    var data : [EKReminder]
    
    init() {
        // リマインダーへのアクセスを要求する。
        store.requestAccess(to: .reminder) { granted, error in
            // リクエストに対するレスポンスを処理する。
        }
        
        //データの取得
        var predicate: NSPredicate? = store.predicateForReminders(in: nil)
        
        
        
        store.fetchReminders(matching: predicate!) { reminders in
            data += reminders!
            print(reminders)
        }
        print(data)
    }
    
    
    
    //    func FetchingRemindersList(){
    //        list = store.calendars(for: .reminder)
    //    }
    
    //リマインダーデータの取得
    func FetchingReminders(){
        var predicate: NSPredicate? = store.predicateForReminders(in: nil)
        
        
        
        store.fetchReminders(matching: predicate!) { reminders in
            self.data += reminders!
            //            print(reminders)
        }
        
        print(data)
        
        //        if let aPredicate = predicate {
        //            store.fetchReminders(matching: aPredicate, completion: {(_ reminders: [Any]?) -> Void in
        //                for reminder: EKReminder? in reminders as? [EKReminder?] ?? [EKReminder?]() {
        //                    // リマインダーのたびに何かする。
        ////                    print(reminders)
        //                    self.data += reminders!
        //
        //                }
        //            })
        //        }
    }
    
    
}
