//
//  ListRowView.swift
//  TodoList
//
//  Created by Mac on 15/08/2024.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}
struct ListRowView_Previews: PreviewProvider {
    static var previews: some View{
        ListRowView(title: "")
        
    }
}
