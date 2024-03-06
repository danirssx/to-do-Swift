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
    
    
//    Animations && Utilities
    @State private var tap = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("\(item.task)", text: self.$item.task)
                        .font(.system(size: 25, design: .rounded))
                        .foregroundColor(Color(.systemGray2))
                        .disableAutocorrection(true)
                        .focused($nameIsFocused)
                    
                } header: {
                    Text("About")
                }
                
                
                Section {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Tag")
                        Image(systemName: "square")
                        Image(systemName: "circle")
                        Spacer()
                        
                    }
                }
                
                Section {
                    DatePicker(
                            "Start Date",
                            selection: $date,
                            displayedComponents: [.date]
                            )
                    .datePickerStyle(.compact)
                } header: {
                    Text("Choose Date")
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
