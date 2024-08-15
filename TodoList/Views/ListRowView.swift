//
//  ListRowView.swift
//  TodoList
//
//  Created by Mac on 15/08/2024.
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
struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First Item", isCompleted: true)
    static var item2 = ItemModel(title: "Second Item", isCompleted: false)
    static var previews: some View{
        //ListRowView(item : ItemModel(title: "This is task by Default", isCompleted: true))
        
//        ListRowView(item: item1)
//        ListRowView(item: item2)  // is trah 2 screen dikhata hai
        
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits) // yr krny sy bhi frk nhi pra kuch
    }
}
