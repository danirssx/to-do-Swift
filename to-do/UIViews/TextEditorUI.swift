//
//  TextEditorUI.swift
//  to-do
//
//  Created by Daniel Ross on 3/6/24.
//

import SwiftUI

struct TextEditorUI: View {
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                VStack {
                    Text("Some Details...")
                        .padding(.top, 10)
                        .padding(.leading, 6)
                        .foregroundColor(Color(.systemGray3))
                    Spacer()
                }
            }
            
            VStack {
                TextEditor(text: $text)
                    .frame(maxHeight: .infinity)
            }
           
        }.frame(height: 125)
    }
}
