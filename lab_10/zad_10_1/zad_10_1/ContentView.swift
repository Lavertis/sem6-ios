//
//  ContentView.swift
//  zad_10_1
//
//  Created by Rafał Kuźmiczuk on 08/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var coordinate = CLLocationCoordinate2D(
        latitude: 51.2353112433304,
        longitude: 22.55289822681853
    )
    @State var latitude: String = ""
    @State var longitude: String = ""
    @State var zoom: Double = 0.1
    
    var body: some View {
        VStack {
            MapView(coordinate: $coordinate, zoom: $zoom)
                .frame(height: UIScreen.main.bounds.size.height / 2, alignment: .center)
                .gesture(TapGesture(count: 1)
                    .onEnded { _ in
                        if self.zoom > 0.05 {
                            self.zoom = self.zoom * 0.8
                        }
                        else {
                            self.zoom = 0.1
                        }
                    }
                )
            
            Form {
                HStack {
                    Text("Latitude")
                    TextField("Latitude", text: $latitude)
                }
                HStack {
                    Text("Longitude")
                    TextField("Longitude", text: $longitude)
                }
                Button("Go to coordinates", action: {
                    self.changeRegion(
                        latitude: Double(self.latitude)!,
                        longitude: Double(self.longitude)!
                    )
                })
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    private func changeRegion(latitude: Double, longitude: Double) {
        self.coordinate.latitude = latitude
        self.coordinate.longitude = longitude
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
