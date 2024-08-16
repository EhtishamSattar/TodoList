//
//  ListViewModel.swift
//  TodoList
//
//  Created by Mac on 15/08/2024.
//

import Foundation

/*
 CRUD OPERATIONS
 CREATE
 READ
 UPDATE
 DELETE

 */

class ListViewModel: ObservableObject {
    
    var showAlertBeforeDel : Bool = false
    
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    let forKey : String = "Items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "This is the first title", isCompleted: false),
//            ItemModel(title: "This is the Second title", isCompleted: true),
//            ItemModel(title: "This is the Third title", isCompleted: false)
//        ]
        
        //items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: forKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        }{
//            
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id }){
            //items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
            
            items[index] = item.updateCompletion()
        }
            
    }
    
//    func showAlertBeforeDelete(){
//        
//    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: forKey)
        }
    }
}
