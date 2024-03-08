//
//  ContentView.swift
//  to-do
//
//  Created by Daniel Ross on 2/24/24.
//

// This is the main View, all the important info it's right here

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var isShowingSubContentView = false
}

struct ContentView: View {
    @State var todos: [Information] = articles
    @State var selectedItem: UUID?
    
    var body: some View {
        
        NavigationView {
            ScrollView(showsIndicators: false) {
                    VStack {
                            
                        ListModalView(todos: $todos, selectedItem: $selectedItem)
                    
//                        Another Text
                        
                        Text("daniel")
                                .foregroundColor(.blue)

                }
                .navigationTitle("Menu")
            }
            
        }
    }
}

struct ListModalView: View {
    @Binding var todos: [Information]
    @Binding var selectedItem: UUID?
    
    var body: some View {
        Section {
//            ORIGINAL ------
            NavigationLink(destination: ListView(todos: $todos, selectedItem: $selectedItem)) {
//            TESTING -----
//            NavigationLink(destination: ListView())
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 350, height: 175)
                        .overlay(
                            LinearGradient(gradient: .init(colors: [.yellow, .orange, .red]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
                        .cornerRadius(20)
                    
                    ZStack {
                        Text("Tasks")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .offset(x: -60, y: -40)
                            .multilineTextAlignment(.leading)
                        
                        Rectangle()
                            .frame(height: 2)
                            .offset(y: -10)
                            .foregroundColor(Color(.systemGray5).opacity(0.3))
                        
                        Text("Here you can see your tasks and the one of your friends.")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .bold()
                            .offset(y: 20)
                    }.padding(35)
                    
                    
                }.frame(width: 350, height: 170)
            }
        }.padding([.bottom, .top], 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
