//
//  ContentView.swift
//  to-do
//
//  Created by Daniel Ross on 2/24/24.
//

// This is the main View, all the important info it's right here

import SwiftUI

struct ContentView: View {
    @State var todos: [Information] = articles
    
    @State var selectedItem: UUID?
    
    var body: some View {
        
        NavigationView {
//                TaskView(todos: $todos)
//                    .padding()
                ListView(todos: $todos, selectedItem: $selectedItem)
            
            .navigationTitle("To-Do App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
