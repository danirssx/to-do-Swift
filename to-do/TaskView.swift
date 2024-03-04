//
//  TaskView.swift
//  to-do
//
//  Created by Daniel Ross on 2/24/24.
//

// This is where you find the input View

import SwiftUI

struct Information: Identifiable, Equatable {
    let id = UUID()
    var task: String
    var type: Color
    var completed: Bool = false
}

struct TaskView: View {
    @Binding var todos: [Information]
    
    // Data
    var typeOfTask: [Color] = [
        Color.indigo, Color.blue, Color.cyan
    ]
    let difficulties: [String] = ["Easy", "Medium", "Hard"]
    @State private var selectedType: Color = .indigo

    // Functionality
    @State private var taskInput: String = ""
    
    private var available: Bool {
        !taskInput.isEmpty
    }
    

    
    var body: some View {
        VStack {
            HStack {
                    TextField("Task", text: $taskInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .onSubmit {
                                    addTodo()
                                }
                    Picker("Select a color", selection: $selectedType) {
                                ForEach(0 ..< typeOfTask.count, id: \.self) { todo in
                                    Text(self.difficulties[todo])
                                        .foregroundColor(self.typeOfTask[todo])
                                        .tag(self.typeOfTask[todo])
                                }
                    }
                            .pickerStyle(MenuPickerStyle())
                            .foregroundColor(.white)
            
        }
            .padding()
            
//            The "SEND" Button
            
            Button(action: {
                addTodo()
                print("Task: \(taskInput)")
                print("\(todos)")
            }) {
                Text("Send")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(available ? Color.blue : Color.gray)
                    .cornerRadius(15)
            }
            .disabled(!available)
            
        }
    }
    
    
    
    func addTodo() {
        todos.append(Information(task: taskInput, type: selectedType))
        // Clear Input
        taskInput = ""
    }
    
}
//
//struct TaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskView(todos: $todos)
//    }
//}
