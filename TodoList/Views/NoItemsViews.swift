//
//  NoItemsViews.swift
//  TodoList
//
//  Created by Mac on 15/08/2024.
//

import SwiftUI

struct NoItemsViews: View {
    
    @State var animate : Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you1 a productive persion? I think you should click the add button and add a bunch of Items to your Todo list")
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color(.red) : Color.blue.opacity(0.7))
                        .cornerRadius(10)
                        .padding()
                        
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? Color.red.opacity(0.7) : Color.blue.opacity(0.7) , radius: animate ? 30 : 10 , x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)

            }
            .multilineTextAlignment(.center)
            .onAppear(perform: {
                addAnimation()
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding(.top, 40)
    }
    
    func addAnimation(){
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsViews()
}
