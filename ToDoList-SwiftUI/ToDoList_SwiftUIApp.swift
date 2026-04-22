//
//  ToDoList_SwiftUIApp.swift
//  ToDoList-SwiftUI
//
//  Created by Arqam Owais on 20/04/2026.
//

import SwiftUI

@main
struct ToDoList_SwiftUIApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
