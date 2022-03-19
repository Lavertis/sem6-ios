//
//  ContentView.swift
//  zad_4_1
//
//  Created by Rafał Kuźmiczuk on 19/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private var currencies: [String:Double] = ["PLN": 1, "USD": 4.27, "EUR": 4.72, "GBP": 5.62]
    @State private var sourceCurrency: String = "PLN"
    @State private var destinationCurrency: String = "PLN"
    @State private var amount: Int = 1
    @State private var showHours: Bool = false
    @State private var showContact: Bool = false
    
    var body: some View {
        VStack {
            Text("Kantor")
                .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.green)
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            Group {
                Text("Kupowana waluta")
                
                TextField("Wartość kupowanej waluty", text: Binding(
                    get: { String(self.amount) },
                    set: { self.amount = abs(Int($0) ?? self.amount) }
                    )
                )
                .multilineTextAlignment(.center)
                .padding(.top)
                
                Picker("Kupowana waluta", selection: $sourceCurrency) {
                    ForEach(Array(currencies.keys), id: \.self) { key in
                        Text(key)
                    }
                }.labelsHidden()
            }
            
            Divider().padding()
            
            Group {
                Text("Płatność za pomocą")
                
                Picker("Płatność za pomocą", selection: $destinationCurrency) {
                    ForEach(Array(currencies.keys), id: \.self) { key in
                        Text(key)
                    }
                }.labelsHidden()
                
                Text("Do zapłaty: \(self.currencies[self.sourceCurrency]! / self.currencies[self.destinationCurrency]! * Double(self.amount), specifier: "%.2f") \(self.destinationCurrency)")
            }
            
            Spacer()
            HStack {
                Button(action: {
                    self.showHours = true
                }) {
                    Text("Godziny otwarcia")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.orange)
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                }
                .alert(isPresented: $showHours) {
                    Alert(
                        title: Text("Godziny otwarcia"),
                        message: Text("Poniedziałek-Piątek: 10:00-18:00")
                    )
                }
                
                Button(action: {
                    self.showContact = true
                }) {
                    Text("Kontakt")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.orange)
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                }
                .alert(isPresented: $showContact) {
                    Alert(
                        title: Text("Kontakt"),
                        message: Text("kantor@email.com")
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
