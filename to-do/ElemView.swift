//
//  ElemView.swift
//  to-do
//
//  Created by Daniel Ross on 3/4/24.
//

import SwiftUI

struct ElemView: View {
//    @Binding var todos: [Information]
//    @Binding var selectedItem: UUID?
    @State var item: Information = Information(task: "Lavar perros", type: Color.indigo)
    @State private var date = Date()
    
//    Utilities
    @FocusState private var nameIsFocused: Bool
    private var options = ["Urgent", "Not Urgent", "Maths"]
    
    
//    Animations && Utilities
    @State private var tap = false
    
    var body: some View {
        NavigationView {
            Form {
//                Title
                
                Section {
                    TextField("\(item.task)", text: self.$item.task)
                        .font(.system(size: 20, design: .rounded))
                        .foregroundColor(Color(.systemGray2))
                        .disableAutocorrection(true)
                        .focused($nameIsFocused)
                    
                } header: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.green)
                        Text("About")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .bold()
                    }
                }
                
//                Tag
                
                Section {
                    Picker(selection: $item.tag, label: Text("Type of Task")) {
                        ForEach(options, id: \.self) {
                            option in
                            Text(option)
                        }
                    }.pickerStyle(MenuPickerStyle())
                } header: {

                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.cyan)
                        Text("Tag")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .bold()
                    }
                }
                
//                Date Picker
                
                Section {
                    DatePicker(
                            "Start Date",
                            selection: $item.date,
                            displayedComponents: [.date]
                            )
                    .padding(5)
                    .datePickerStyle(.compact)
                } header: {
                    Text("Choose Date")
                }
                
//                Note Action
                
                Section {
                    TextEditorUI(text: $item.note)
                    } header: {
                    Text("Note")
                }
            }
            .navigationTitle("Edit the Item")
        }
    }
    
//    func changeItem() {
//        if let index = todos.firstIndex(where: { $0.id == item.id }) {
//            todos[index] = item
//        }
//    }
}

struct ElemView_Previews: PreviewProvider {
    static var previews: some View {
        ElemView()
    }
}
