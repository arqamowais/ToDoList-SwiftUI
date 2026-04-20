//
//  ItemModel.swift
//  ToDoList-SwiftUI
//
//  Created by Arqam Owais on 21/04/2026.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
}
