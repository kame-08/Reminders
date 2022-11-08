//
//  EventManager.swift
//  Reminders
//
//  Created by Ryo on 2022/09/30.
//https://developer.apple.com/documentation/eventkit

import Foundation
import EventKit

class EventManager {
    // ストアを初期化する。
    var store: EKEventStore
    
    //FetchingRemindersの中に入れるとダメな理由？
    var hoge: [EKReminder] = []
    
    init() {
        store = EKEventStore()
        
        //リマインダーへのアクセスを要求する。
        store.requestAccess(to: .reminder) { granted, error in
            // リクエストに対するレスポンスを処理する。
        }
        //initの中で呼び出さないと初回起動時に表示されない(onAppear, taskだとダメっぽい?)
        FetchingReminders()
    }
    
    func FetchingReminders() -> [EKReminder]{        
        //var predicate: NSPredicate? = store.predicateForReminders(in: nil)
        //実験用のリストに接続
        var predicate: NSPredicate? = store.predicateForReminders(in: [store.calendars(for: .reminder).first!])
        store.calendars(for: .reminder)
        if let predicate {
            store.fetchReminders(matching: predicate, completion: {(_ reminders: [Any]?) -> Void in
                //これを上になるとだめな理由？
                self.hoge = []
                for reminder: EKReminder? in reminders as? [EKReminder?] ?? [EKReminder?]() {
                    // リマインダーのたびに何かをする。
                    self.hoge += [reminder!]
                }
                print(self.hoge)
            })
        }
        return hoge
    }
}
