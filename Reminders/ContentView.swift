//
//  ContentView.swift
//  Reminders
//
//  Created by Ryo on 2022/09/30.
//

import SwiftUI

struct ContentView: View {
    
    //    @StateObject var viewModel = ContentViewModel()
    @ObservedObject var viewModel = ContentViewModel()
    
    //AddRemindersViewの表示非表示
    @State var sheet = false
    
    //実行済みの表示非表示
    @State var view = false
    
    var body: some View {
        let _ = Self._printChanges()
        NavigationStack {
            List {
                ForEach(viewModel.data, id: \.self) { reminders in
                    //trueの場所に表示、非表示のフラグ
                    if reminders.isCompleted && !view {
                        //実行済みが非表示になっている場合は表示しない
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
                        view.toggle()
                    } label: {
                        ZStack {
                            //ショートカットの文字
                            Text(view ?  "実行済みを非表示" : "実行済みを表示")
                                .frame(width: 0, height: 0)
                            Image(systemName: view ? "eye.fill" : "eye.slash.fill")
                            
                        }
                    }
                    .keyboardShortcut("H", modifiers: [.command,.shift])
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        //ハーフシートでリマインダーの追加
                        sheet.toggle()
                    } label: {
                        ZStack {
                            //ショートカットの文字
                            Text("新規リマインダーを追加")
                                .frame(width: 0, height: 0)
                            //Label("新規", systemImage: "plus.circle.fill")
                            
                            HStack{
                                Image(systemName: "plus.circle.fill")
                                Text("新規")
                            }
                            
                            
                            
                        }
                        
                    }
                    .keyboardShortcut("n", modifiers: [.command])
                    
                    //左下に表示するためにToolbarItemGroupにしてSpacer書いていいの？
                    Spacer()
                    
                }
            }
            .sheet(isPresented: $sheet, content: {
                AddRemindersView()
                    .presentationDetents([.medium])
            })
            
            .refreshable {
                //リストの更新
                viewModel.FetchingReminders()
            }
            .keyboardShortcut("R", modifiers: [.command])
        }
        //        .onAppear(){
        //
        //        }
        .task {
            viewModel.data = viewModel.eventManager.FetchingReminders()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
