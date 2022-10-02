//
//  ContentView.swift
//  Reminders
//
//  Created by Ryo on 2022/09/30.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    @State var sheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.data, id: \.self) { reminders in
                    //trueの場所に表示、非表示のフラグ
                    if reminders.isCompleted && true {
                        
                    }else{
                        RemindersColumn(hogesss: reminders)
                    }
                    
                    
                }
                
            }
            .navigationTitle("リマインダー")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu(viewModel.menu) {
                        Button {
                            viewModel.menu = "全て"
                        } label: {
                            Text("全て")
                        }
                        Button {
                            viewModel.menu = "プライベート"
                        } label: {
                            Text("プライベート")
                        }
                        Button {
                            viewModel.menu = "学校"
                        } label: {
                            Text("学校")
                        }
                        Button {
                            viewModel.menu = "卒業制作"
                        } label: {
                            Text("卒業制作")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //ハーフシートでリマインダーの追加
                        sheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .keyboardShortcut("N", modifiers: [.command])
                }
            }
            .sheet(isPresented: $sheet, content: {
                AddRemindersView()
                    .presentationDetents([.medium])
            })
            
            .refreshable {
                //TODO: リストの更新
                viewModel.FetchingReminders()
            }
            .keyboardShortcut("R", modifiers: [.command])
        }
        .onAppear(){
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
