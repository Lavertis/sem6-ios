//
//  ContentView.swift
//  zad_3_2
//
//  Created by Rafał Kuźmiczuk on 13/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let tiresManager: TiresManager = TiresManager()
    @State private var chosenSize: Int = 15
    @State private var chosenManufacturer: String = "Bridgestone"
    @State private var chosenQuantity: Int = 1
    @State private var availability: String = ""
    
    var body: some View {
        VStack {
            Text("Rozmiar opony")
            Picker(selection: $chosenSize, label: Text("Rozmiar")) {
                ForEach(tiresManager.getAllSizes(), id: \.self) { size in
                    Text(String(size))
                }
            }.padding(.vertical).pickerStyle(SegmentedPickerStyle())
            Text("Wybrany rozmiar: \(chosenSize)")
            
            Picker(selection: $chosenManufacturer, label: Text("Producent")) {
                ForEach(tiresManager.getAllManufacturers(), id: \.self) { manufacturer in
                    Text(manufacturer)
                }
            }
            Text("Wybrany producent: \(chosenManufacturer)")
                .padding(.bottom)
            
            Text("Liczba opon").padding(.top)
            TextField("1", text: Binding(
                get: { String(self.chosenQuantity) },
                set: {
                    self.chosenQuantity = Int($0) ?? self.chosenQuantity
                    if self.chosenQuantity < 1 {
                        self.chosenQuantity = 1
                    }
                }
            ))
            .keyboardType(.numberPad)
            .padding()
            .frame(width: 75.0)
            .border(Color.black)
            .multilineTextAlignment(.center)
            Text("Wybrana liczba opon: \(chosenQuantity)")
            .padding(.bottom)
            
            Button(action: {
                let available = self.tiresManager.checkAvailability(manufacturer: self.chosenManufacturer, size: self.chosenSize, quantity: self.chosenQuantity)
                if available {
                    self.availability = "Dostępne"
                }
                else {
                    self.availability = "Niedostępne"
                }
            }) {
                Text("Sprawdź dostępność")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            .padding(.vertical)
            
            Text(availability)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
