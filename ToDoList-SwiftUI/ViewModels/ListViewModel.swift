//
//  ListViewModel.swift
//  ToDoList-SwiftUI
//
//  Created by Arqam Owais on 23/04/2026.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    
    @Published private var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    
    private let itemsKey: String = "items_list"
    
    init() {
        loadItems()
    }
    
    private func loadItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        if let savedItems = savedItems {
            items.append(contentsOf: savedItems)
        }
    }
    
    func getItems() -> [ItemModel] {
        return items
    }
    
    func deleteItem(offsets: IndexSet) {
        // sorted(by: >) ensures you remove from the highest index first so the indices don’t shift unexpectedly.
        for index in offsets.sorted(by: >) {
            items.remove(at: index)
        }
    }

    func moveItem(from: IndexSet, to: Int) {
        // Convert IndexSet to array and sort ascending
        let sourceIndices = from.sorted()
        
        // Extract the items to move
        let movingItems = sourceIndices.map { items[$0] }
        
        // Remove items from the array starting from the highest index
        for index in sourceIndices.reversed() {
            items.remove(at: index)
        }
        
        // Calculate adjusted destination index
        // If moving down the array, the destination index shifts down by the number of removed items before it
        var destinationIndex = to
        let numberOfRemovedBeforeTo = sourceIndices.filter { $0 < to }.count
        destinationIndex -= numberOfRemovedBeforeTo
        
        // Insert items at the adjusted destination index
        items.insert(contentsOf: movingItems, at: destinationIndex)
            
    }
    
    func addItem(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }

}
