//
//  ListView.swift
//  ToDoList-SwiftUI
//
//  Created by Arqam Owais on 21/04/2026.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.getItems().count == 0 {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List{
                    ForEach (listViewModel.getItems()) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }
        .listStyle(.plain)
        .navigationTitle("To-Do List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
            )
    }
    
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
