//
//  FlatView.swift
//  zad_7_2
//
//  Created by Rafał Kuźmiczuk on 11/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//


import SwiftUI
struct FlatView: View {
    var flat: Flat
    
    var body: some View {
        VStack {
            Text(flat.name).padding()
            Image(flat.photoPath)
            .resizable()
            .frame(width: 300, height: 200)
            Text("Area: " + String(flat.area)).padding()
            Text("Duplex: " + String(flat.isDuplex)).padding()
            Text("Room count: " + String(flat.roomCount)).padding()
        }.navigationBarTitle(Text("Flat details"))
    }
}

struct FlatView_Previews: PreviewProvider {
    static var previews: some View {
        FlatView(flat: Flat(name: "Flat 1", area: 89.45, roomCount: 6, isDuplex: true, photoPath: "flat1"))
    }
}
