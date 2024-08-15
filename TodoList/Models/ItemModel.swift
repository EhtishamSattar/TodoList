//
//  ItemModel.swift
//  TodoList
//
//  Created by Mac on 15/08/2024.
//

import Foundation

struct ItemModel : Identifiable {
    let id : String = UUID().uuidString
    let title : String
    let isCompleted : Bool
}
