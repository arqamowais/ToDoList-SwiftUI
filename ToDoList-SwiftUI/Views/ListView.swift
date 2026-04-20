//
//  ListView.swift
//  ToDoList-SwiftUI
//
//  Created by Arqam Owais on 21/04/2026.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [ItemModel(title: "Buy groceries", isCompleted: true), ItemModel(title: "Walk a mile", isCompleted: false), ItemModel(title: "Finish homework", isCompleted: true)]
    
    var body: some View {
        List {
            ForEach (items) { item in
                ListRowView(item: item)
            }
            
        }
        .listStyle(.plain)
        .navigationTitle("To-Do List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: Text("Destination"))
            )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}
