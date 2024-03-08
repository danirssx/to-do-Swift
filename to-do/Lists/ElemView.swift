//
//  ElemView.swift
//  to-do
//
//  Created by Daniel Ross on 3/4/24.
//

import SwiftUI

struct ElemView: View {
    @Binding var todos: [Information]
    @State var item: Information
    
//    Utilities
//    private var options = ["Urgent", "Not Urgent", "Maths"]
    
//  Functionalities
    @Environment (\.dismiss) var dismiss
    @State private var showAlert: Bool = false
    
//    Animations && Utilities
    @State private var tap: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
//                Title
                
                Section {
                    TextField("\(item.task)", text: self.$item.task)
                        .font(.system(size: 20, design: .rounded))
                        .foregroundColor(Color(.systemGray2))
                        .disableAutocorrection(true)
                    
                } header: {
                    HeaderUI(backColor: .green, text: "About")
                }
                
//                Tag
                
                Section {
                    Picker(selection: $item.tag, label: Text("Type of Task")) {
                        Text("Danielito")
                        Text("Robertico")
                        Text("Manuelito")
                    }.pickerStyle(MenuPickerStyle())
                } header: {
                    HeaderUI(backColor: .cyan, text: "Tag")
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
                    HeaderUI(backColor: .pink, text: "Date")
                }
                
//                Note Action
                
                Section {
                    TextEditorUI(text: $item.note)
                    } header: {
                        HeaderUI(backColor: .orange, text: "Some Details")
                }
            }
            .toolbar  {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showAlert = true
                    }, label: {
                        ButtonUI(backColor: .green, text: "Save")
                    })
                };
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        ButtonUI(backColor: .red, text: "Cancel")
                    })
                }
            }
        }
        .alert("Warning", isPresented: $showAlert, actions: {
            Button {
                dismiss()
            } label: {
                Text("Confirm")
            }
            
            Button(role: .cancel, action: {}) {
                Text("Cancel")
            }
        }, message: {
            Text("Save Changes will delete the previous task. Are you sure?")
        }
        )
    }
    
    func changeItem() {
        if let index = todos.firstIndex(where: { $0.id == item.id }) {
            todos[index] = item
        }
    }
}

 
