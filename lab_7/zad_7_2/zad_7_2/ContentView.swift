//
//  ContentView.swift
//  zad_7_2
//
//  Created by Rafał Kuźmiczuk on 04/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var houses: [House] = [
        House(name: "House 1", houseArea: 111.1, roomCount: 3, floorCount: 1, landArea: 154.15, photoPath: "house1"),
        House(name: "House 2", houseArea: 222.2, roomCount: 4, floorCount: 2, landArea: 423.45, photoPath: "house2"),
        House(name: "House 3", houseArea: 111.1, roomCount: 5, floorCount: 3, landArea: 245.46, photoPath: "house3"),
    ]
    var flats: [Flat] = [
        Flat(name: "Flat 1", area: 89.45, roomCount: 6, isDuplex: true, photoPath: "flat1"),
        Flat(name: "Flat 2", area: 75.45, roomCount: 5, isDuplex: false, photoPath: "flat2"),
        Flat(name: "Flat 3", area: 71.54, roomCount: 3, isDuplex: false, photoPath: "flat3"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Houses"), content: {
                    ForEach(houses, id: \.self.name) { house in
                        NavigationLink(destination: HouseView(house: house), label: {
                            HStack {
                                Text(house.name).padding()
                                Spacer()
                                Image(house.photoPath)
                                .resizable()
                                .frame(width: 150, height: 100)
                            }
                        })
                    }
                })
                Section(header: Text("Flats"), content: {
                    ForEach(flats, id: \.self.name) { flat in
                        NavigationLink(destination: FlatView(flat: flat), label: {
                            HStack {
                                Text(flat.name).padding()
                                Spacer()
                                Image(flat.photoPath)
                                .resizable()
                                .frame(width: 150, height: 100)
                            }
                        })
                    }
                })
            }.navigationBarTitle("Houses & Flats")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
