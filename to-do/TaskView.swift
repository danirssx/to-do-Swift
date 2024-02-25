//
//  TaskView.swift
//  to-do
//
//  Created by Daniel Ross on 2/24/24.
//

import SwiftUI

struct Information: Identifiable {
    let id = UUID()
    var task: String
    var type: String
    var completed: Bool = false
}

struct TaskView: View {
    
    // Data
    var typeOfTask: [Color] = [
        Color.red, Color.yellow, Color.blue
    ]
    let difficulties: [String] = ["Easy", "Medium", "Hard"]
    @State private var selectedType: Color = .red

    // Functionality
    @State private var taskInput: String = ""
    @State private var typeInput: String = ""
    
    @State private var todos: [Information] = []
    
    private var available: Bool {
        !taskInput.isEmpty
    }
    
    var body: some View {
        VStack {
            HStack {
                
                TextField("Task", text: $taskInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Picker("Select a color", selection: $selectedType) {
                    ForEach(0 ..< typeOfTask.count, id: \.self) { todo in
                        Text(self.difficulties[todo])
                            .foregroundColor(self.typeOfTask[todo])
                            .tag(self.typeOfTask[todo])
                    }
                }
                .pickerStyle(.wheel)
                .foregroundColor(.white)
            }
            .padding()
            
//            The "SEND" Button
            
            Button(action: {
                print("Task: \(taskInput)")
            }) {
                Text("Send")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(available ? Color.blue : Color.gray)
                    .cornerRadius(20)
            }
            .disabled(!available)
            
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
