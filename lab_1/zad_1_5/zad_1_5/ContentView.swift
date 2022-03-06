//
//  ContentView.swift
//  zad_1_5
//
//  Created by Rafał Kuźmiczuk on 06/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var number_1: Double = 0.0
    @State private var number_2: Double = 0.0
    @State private var result: Double = 0.0
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Liczba 1:")
                TextField("", text: Binding(
                    get: { String(self.number_1) },
                    set: { self.number_1 = Double($0) ?? self.number_1 }
                ))
                .frame(width: 60)
                .border(Color.blue, width: 1)
            }
            
            HStack {
                Text("Liczba 2:")
                TextField("", text: Binding(
                    get: { String(self.number_2) },
                    set: { self.number_2 = Double($0) ?? self.number_2 }
                ))
                .frame(width: 60)
                .border(Color.blue, width: 1)
            }
            
            Button(action: {
                if self.number_2 == 0 {
                    self.showAlert = true
                    return
                }
                self.result = self.number_1 / self.number_2
            }) {
                Text("Oblicz")
                .padding(.horizontal)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(30)
                .padding()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Uwaga"),
                    message: Text("Dzielenie przez zero")
                )
            }
            
            Text(String(format: "%.3lf", $result.wrappedValue))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
