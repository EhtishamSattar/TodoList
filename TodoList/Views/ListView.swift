//
//  ListView.swift
//  TodoList
//
//  Created by Mac on 15/08/2024.
//

import SwiftUI

struct ListView: View {
    
    //@State var items: [ItemModel] = []
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        
        ZStack{
            if listViewModel.items.isEmpty {
                
                NoItemsViews()
                    .transition(AnyTransition.opacity.animation(.easeIn))
                
                
            }else{
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItems)

                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📆")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: {
                AddView()
            })
        )
        .foregroundColor(.primary)
        
    }
    
    
        
}


struct LiistView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel()) // if we will not do this the app will crash
        .navigationViewStyle(StackNavigationViewStyle()) // Specificly done fot ipad responsiveness
    }
}
//#Preview {
//    ListView()
//}

