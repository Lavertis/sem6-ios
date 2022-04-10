//
//  HouseView.swift
//  zad_7_2
//
//  Created by Rafał Kuźmiczuk on 11/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct HouseView: View {
    var house: House
    
    var body: some View {
        VStack {
            Text(house.name).padding()
            Image(house.photoPath)
            .resizable()
            .frame(width: 300, height: 200)
            Text("House area: " + String(house.houseArea)).padding()
            Text("Land area: " + String(house.landArea)).padding()
            Text("Floor count: " + String(house.floorCount)).padding()
            Text("Room count: " + String(house.roomCount)).padding()
        }.navigationBarTitle(Text("House details"))
    }
}

struct HouseView_Previews: PreviewProvider {
    static var previews: some View {
        HouseView(house: House(name: "House 1", houseArea: 111.1, roomCount: 3, floorCount: 1, landArea: 154.15, photoPath: "house1"))
    }
}
