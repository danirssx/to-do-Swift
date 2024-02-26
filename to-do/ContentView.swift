//
//  ContentView.swift
//  to-do
//
//  Created by Daniel Ross on 2/24/24.
//

import SwiftUI

struct ContentView: View {
    @State var todos: [Information] = []
    
    var body: some View {
        VStack {
            TaskView(todos: $todos)
        }.onChange(of: todos) {
            newValue in
            print("Todos changed: \(newValue)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
