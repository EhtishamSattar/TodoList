//
//  ListView.swift
//  TodoList
//
//  Created by Mac on 15/08/2024.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is first task", isCompleted: false),
        ItemModel(title: "This is second task", isCompleted: true),
        ItemModel(title: "This is third task", isCompleted: false)
    ]
    var body: some View {
        List{
            ForEach(items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: moveItems)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📆")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: {
                AddView()
            })
        )
        
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItems(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
        
}


struct LiistView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView{
            ListView()
        }
    }
}
//#Preview {
//    ListView()
//}

