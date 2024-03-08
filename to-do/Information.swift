//
//  Information.swift
//  to-do
//
//  Created by Daniel Ross on 3/7/24.
//

import SwiftUI
import Foundation

struct Information: Identifiable, Equatable {
    let id = UUID()
    var task: String
    var type: Color
    var tag: String = ""
    var date: Date = Date()
    var note: String = ""
    var completed: Bool = false
}

#if DEBUG

let articles = [Information(task: "Lavar perros", type: Color.indigo), Information(task: "Regar las matas", type: Color.blue), Information(task: "Lavar el carro", type: Color.cyan)]

#endif
