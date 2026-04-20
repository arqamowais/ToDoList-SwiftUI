//
//  ListView.swift
//  ToDoList-SwiftUI
//
//  Created by Arqam Owais on 21/04/2026.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = ["Buy groceries", "Walk a mile", "Finish homework"]
    
    var body: some View {
        List {
            ForEach (items, id: \.self) { item in
                ListRowView(title: item)
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
