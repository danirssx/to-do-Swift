//
//  InputView.swift
//  to-do
//
//  Created by Daniel Ross on 3/6/24.
//

import SwiftUI

struct InputField: View {
    @Binding var item: Information
    
//    Animations && Utilities
    @State private var tap = false
    
    var body: some View {
            HStack {
                Spacer()
                
                ZStack {
                    Circle()
                        .foregroundColor(tap ? .green : .blue)
                        .frame(width: 50)
                        .overlay(
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                            )
                        .scaleEffect(tap ? 1.05 : 1)
                }.onTapGesture {
                    withAnimation(Animation.spring()) {
                        tap.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            tap.toggle()
                        }
                    }
                }
               
            }
    
    }
}

//struct InputField_Previews: PreviewProvider {
//    static var previews: some View {
//        InputField()
//    }
//}
