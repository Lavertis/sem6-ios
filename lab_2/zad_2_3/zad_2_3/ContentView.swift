//
//  ContentView.swift
//  zad_2_3
//
//  Created by Rafał Kuźmiczuk on 05/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

func isTriangle(s1: Int, s2: Int, s3: Int) -> Bool {
    if !(s1 > 0 && s2 > 0 && s3 > 0) {
        return false
    }
    if !(s1 + s2 > s3 && s1 + s3 > s2 && s2 + s3 > s1) {
        return false
    }
    return true
}

struct ContentView: View {
    @State private var side_1: Int = 0
    @State private var side_2: Int = 0
    @State private var side_3: Int = 0
    @State private var result: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Bok 1: ")
                    .foregroundColor(.red)
                TextField("", text: Binding(
                    get: { String(self.side_1) },
                    set: { self.side_1 = Int($0) ?? self.side_1}
                ))
                    .border(Color.red, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .frame(width: 50)
            }
            
            HStack {
                Text("Bok 2: ")
                    .foregroundColor(.green)
                TextField("", text: Binding(
                    get: { String(self.side_2) },
                    set: { self.side_2 = Int($0) ?? self.side_2}
                ))
                    .border(Color.green, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .frame(width: 50)
            }
            
            HStack {
                Text("Bok 3: ")
                    .foregroundColor(.blue)
                TextField("", text: Binding(
                    get: { String(self.side_3) },
                    set: { self.side_3 = Int($0) ?? self.side_3}
                ))
                    .border(Color.blue, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .frame(width: 50)
            }
            
            Text("Podano \(side_1), \(side_2), \(side_3)")
                .padding(.vertical)
                .foregroundColor(.purple)
            
            Button("Trojkat", action: {
                if isTriangle(s1: self.side_1, s2: self.side_2, s3: self.side_3) {
                    self.result = "Da sie zbudowac trojkat"
                }
                else {
                    self.result = "Nie da sie zbudowac trojkata"
                }
            }).padding(.horizontal, 5.0)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(30)
            
            Text("\(result)")
                .padding(.vertical)
                .foregroundColor(.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
