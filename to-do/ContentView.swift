//
//  ContentView.swift
//  to-do
//
//  Created by Daniel Ross on 2/24/24.
//

import SwiftUI

struct ContentView: View {
    @State var todos: [Information] = [Information(task: "Lavar perros", type: Color.indigo), Information(task: "Regar las matas", type: Color.blue), Information(task: "Lavar el carro", type: Color.cyan)]
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                TaskView(todos: $todos)
                    .padding()
                ListView(todos: $todos)
            }.onChange(of: todos) {
                newValue in
                print("Todos changed: \(newValue)")
            }
            .navigationTitle("To-Do App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
