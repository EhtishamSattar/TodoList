//
//  AddView.swift
//  TodoList
//
//  Created by Mac on 15/08/2024.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText : String = ""
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type Something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.gray)).opacity(0.3)
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                    
                
            }
            .padding(14)
        }
        .navigationTitle("Add a Todo task 🗒️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView{
            AddView()
        }
        
    }
}
