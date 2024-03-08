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
    @Binding var selectedItem: UUID?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    HStack {
                        HStack {
                            Button(action: {}) {
                                Image(systemName: todo.completed ? "checkmark.square.fill" : "square")
                                    .foregroundColor(Color.blue)
                            }
                        }.overlay(
                            Rectangle()
                                .fill(Color.clear)
                                .contentShape(Rectangle())
                                .onTapGesture { markAsCompleted(todo) }
                        )
                        // CheckMark
                        
                        HStack {
                            NavigationLink(destination: ElemView(todos: $todos, item: todo))
                            {
                                Text(todo.task)
                                    .foregroundColor(todo.completed ? Color.primary : Color.gray)
                                    .tag(todo.task)
                            }
                            
                        }
                        .overlay(
                            Rectangle()
                                .fill(Color.clear)
                                .contentShape(Rectangle())
                        )
                        
                    }.listRowBackground(todo.completed ? todo.type.opacity(0.5) : todo.type.opacity(0.2))
                    
                    // Aqui corta
                    
                }.onDelete(perform: delete)
                
            }.navigationBarItems(trailing: EditButton())
        
        }
        .cornerRadius(20)
        .padding()
        
    }
    
    func indexOfTodo(_ list: Information) -> Binding<UUID?> {
        self.selectedItem = list.id
        return $selectedItem
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
