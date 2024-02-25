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
    var type: Color
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
    
    init() {
        // Initialize
        todos = [
            Information(task: "Bajar el perro a lavar", type: typeOfTask[1])
        ]
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
                            .pickerStyle(MenuPickerStyle())
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
                    .cornerRadius(15)
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
