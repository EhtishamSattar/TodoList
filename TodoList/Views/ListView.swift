//
//  ListView.swift
//  TodoList
//
//  Created by Mac on 15/08/2024.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is the title",
        "This is the second",
        "Third"
    ]
    var body: some View {
        List{
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
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

