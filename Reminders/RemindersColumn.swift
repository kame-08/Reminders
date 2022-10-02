//
//  RemindersColumn.swift
//  Reminders
//
//  Created by Ryo on 2022/10/01.
//

import SwiftUI
import EventKit

struct RemindersColumn: View {
    var hogesss:EKReminder
    var body: some View {
        HStack {

                Image(systemName: hogesss.isCompleted ? "circle.inset.filled" : "circle" )
                .foregroundColor(hogesss.isCompleted  ? Color.accentColor : Color.primary)
                Text(hogesss.title)
            
            

            
            
        }
    }
}

//struct RemindersColumn_Previews: PreviewProvider {
//    static var previews: some View {
//        RemindersColumn()
//    }
//}
