//
//  ContentView.swift
//  zad_4_2
//
//  Created by Rafał Kuźmiczuk on 18/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    private let shapes: [String] = ["Kwadrat", "Koło", "Trójkąt"]
    private let colours: [String:Color] = ["Czerwony": Color.red, "Zielony": Color.green, "Niebieski": Color.blue, "Fioletowy": Color.purple]
    @State private var selectedShape: String = "Kwadrat"
    @State private var selectedColour: String = "Czerwony"
    @State private var frameSize: Int = 100
    @State private var withFrame = false
    
    var body: some View {
        VStack {
            Picker(selection: $selectedShape, label: Text("Favorite Shape")) {
                ForEach(shapes, id: \.self) { shape in
                    Text(shape)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Picker(selection: $selectedColour, label: Text("Favorite Colour")) {
                ForEach(Array(colours.keys), id: \.self) { key in
                    Text(key)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            HStack {
                Text("Frame size").padding(.horizontal)
                TextField("Frame size", text: Binding(
                    get: { String(self.frameSize) },
                    set: { self.frameSize = Int($0) ?? self.frameSize })
                )
            }.multilineTextAlignment(.center)
            
            Toggle("Ramka", isOn: $withFrame)
                .padding(.horizontal)
            
            if selectedShape == "Kwadrat" {
                Rectangle()
                .fill(self.colours[self.selectedColour]!)
                .padding(5.0)
                .frame(width: CGFloat(self.frameSize), height: CGFloat(self.frameSize))
                    .border(Color.black, width: self.withFrame == true ? 5 : 0)
            }
            else if selectedShape == "Koło" {
                Circle()
                .fill(self.colours[self.selectedColour]!)
                .padding(5.0)
                .frame(width: CGFloat(self.frameSize), height: CGFloat(self.frameSize))
                    .border(Color.black, width: self.withFrame == true ? 5 : 0)
            }
            else if selectedShape == "Trójkąt" {
                Triangle()
                .fill(self.colours[self.selectedColour]!)
                .padding(5.0)
                .frame(width: CGFloat(self.frameSize), height: CGFloat(self.frameSize))
                    .border(Color.black, width: self.withFrame == true ? 5 : 0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

