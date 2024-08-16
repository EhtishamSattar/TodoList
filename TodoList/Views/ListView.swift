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
    @State var showAlert : Bool = false
    
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
//                    .alert(isPresented: $showAlert, content: {
//                        return Alert(title: Text("You sms will be deleted"))
//                    })
                    .onMove(perform: listViewModel.moveItems)
//                    .onDelete(perform: { IndexSet in
//                        showAlert.toggle()
//                    })
                    .onDelete(perform: listViewModel.deleteItem)
                    

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

