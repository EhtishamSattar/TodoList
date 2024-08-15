//
//  AddView.swift
//  TodoList
//
//  Created by Mac on 15/08/2024.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText : String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var mode
    
    @State var showAlert : Bool = false
    @State var alertTitle : String = ""
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type Something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.gray))
                    .cornerRadius(10)
                
                Button(action: {
                    saveButtonPressed()
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
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            mode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!! 🥴😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
        
    }
}
