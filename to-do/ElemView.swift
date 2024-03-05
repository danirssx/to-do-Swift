//
//  ElemView.swift
//  to-do
//
//  Created by Daniel Ross on 3/4/24.
//

import SwiftUI

struct ElemView: View {
    @Binding var todos: [Information]
    @Binding var selectedItem: UUID?
    let item: Information
    
    var body: some View {
        Text(item.task)
            .foregroundColor(item.type)
        Text(item.completed ? "Positivo" : "Negativo")
    }
}

//struct ElemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ElemView()
//    }
//}
