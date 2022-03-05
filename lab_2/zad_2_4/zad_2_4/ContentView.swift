//
//  ContentView.swift
//  zad_2_4
//
//  Created by Rafał Kuźmiczuk on 05/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var number_1: Int = 0
    @State private var number_2: Int = 0
    @State private var result: Double = 0.0
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Liczba 1:")
                TextField("", text: Binding(
                    get: { String(self.number_1) },
                    set: { self.number_1 = Int($0) ?? self.number_1 }
                ))
                .frame(width: 50)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            }
            
            HStack {
                Text("Liczba 2:")
                TextField("", text: Binding(
                    get: { String(self.number_2) },
                    set: { self.number_2 = Int($0) ?? self.number_2 }
                ))
                .frame(width: 50)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            }
            
            HStack {
                Button(action: {
                    self.result = Double(self.number_1) + Double(self.number_2)
                }) {
                    Text("+")
                    .frame(width: 50)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                }
                
                Button(action: {
                    self.result = Double(self.number_1) - Double(self.number_2)
                }) {
                    Text("-")
                    .frame(width: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                }
            }.padding()
            
            HStack {
                Button(action: {
                    self.result = Double(self.number_1) * Double(self.number_2)
                }) {
                    Text("*")
                    .frame(width: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                }
                
                Button(action: {
                    if self.number_2 == 0 {
                        self.showAlert = true
                        return
                    }
                    self.result = Double(self.number_1) / Double(self.number_2)
                }) {
                    Text("/")
                    .frame(width: 50)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                }.alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Uwaga"),
                        message: Text("Dzielenie przez zero")
                    )
                }
            }
            
            Text(String(result)).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
