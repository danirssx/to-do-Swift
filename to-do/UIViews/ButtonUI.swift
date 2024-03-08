//
//  ButtonUI.swift
//  to-do
//
//  Created by Daniel Ross on 3/7/24.
//

import SwiftUI

struct HeaderUI: View {
    var backColor: Color = .black
    var text: String?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(backColor)
            Text(text ?? "")
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .bold()
        }
    }
}

struct SendButtonUI: View {
    @State private var tap: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            
            ZStack {
                Circle()
                    .foregroundColor(self.tap ? .green : .blue)
                    .frame(width: 50)
                    .overlay(
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    )
                    .scaleEffect(self.tap ? 1.05 : 1)
            }
            .onTapGesture {
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

struct ButtonUI: View {
    var backColor: Color = .black
    var text: String?
    
    var body: some View {
        Text(self.text ?? "")
            .fontDesign(.rounded)
            .bold()
            .foregroundColor(.white)
            .padding(10)
            .background(self.backColor, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}
