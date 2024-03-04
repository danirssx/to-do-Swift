//
//  ListView.swift
//  to-do
//
//  Created by Daniel Ross on 2/25/24.
//

// Here you can find the list displayed

import SwiftUI

struct ListView: View {
    @Binding var todos: [Information]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    HStack {
                        // CheckMark
                        Button(action: {
                            markAsCompleted(todo)
                        }) {
                            Image(systemName: todo.completed ? "checkmark.square.fill" : "square")
                                .foregroundColor(Color.blue)
                        }
                        
                        Text(todo.task)
                            .foregroundColor(todo.completed ? Color.primary : Color.gray)
                            .tag(todo.task)
                            
                    }
                    .listRowBackground(todo.completed ? todo.type.opacity(0.5) : todo.type.opacity(0.2))
                    
                }.onDelete(perform: delete)
            }
        }
        .cornerRadius(20)
        .padding()
        
    }
    
    func markAsCompleted(_ todo: Information) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].completed.toggle()
        }
}
    
    
    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    

    
    
}
//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//
