//
//  ListView.swift
//  to-do
//
//  Created by Daniel Ross on 2/25/24.
//

import SwiftUI

struct ListView: View {
    @Binding var todos: [Information]
    
//    @State var todos: [Information] = [Information(task: "Lavar perros", type: Color.indigo), Information(task: "Regar las matas", type: Color.blue), Information(task: "Lavar el carro", type: Color.cyan)]

    var body: some View {
        VStack {
            List {
                
                ForEach(0 ..< todos.count, id: \.self) { todo in
                    HStack {
                        // Checkmark
                        Button(action: {
                            self.todos[todo].completed.toggle()
                        }) {
                            Image(systemName: self.todos[todo].completed ? "checkmark.square.fill" : "square")
                                .foregroundColor(Color.blue)
                        }
                        
                        // Text Displayed
                        Text(self.todos[todo].task)
                            .foregroundColor(self.todos[todo].completed ? Color.black : Color.gray)
                            .tag(self.todos[todo].task)
                
                    }
                    .listRowBackground(self.todos[todo].completed ?  self.todos[todo].type.opacity(0.5) : self.todos[todo].type.opacity(0.2))
                                }

            }.cornerRadius(20)
                .padding()
            
            
        }
    }
}
//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
