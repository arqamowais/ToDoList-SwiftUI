//
//  ListRowView.swift
//  ToDoList-SwiftUI
//
//  Created by Arqam Owais on 21/04/2026.
//

import SwiftUI

struct ListRowView: View {
    let title: String

    var body: some View {
        HStack{
           Image(systemName: "checkmark.circle")
           Text(title)
           Spacer()
       }
    }
}

#Preview {
    ListRowView(title: "First Item")
}
