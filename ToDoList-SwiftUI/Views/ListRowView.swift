//
//  ListRowView.swift
//  ToDoList-SwiftUI
//
//  Created by Arqam Owais on 21/04/2026.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel

    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
       }
    }
}

#Preview {
    Group {
        ListRowView(item: ItemModel(title: "First Item", isCompleted: true))
        ListRowView(item: ItemModel(title: "Second Item", isCompleted: false))

    }
}
