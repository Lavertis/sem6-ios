//
//  ContentView.swift
//  zad_10_2
//
//  Created by Rafał Kuźmiczuk on 08/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var myAnnotation = MyAnnotation(
        title: "Katedra Informatyki",
        subtitle: "Politechnika Lubelska",
        coordinate: CLLocationCoordinate2D(
            latitude: 51.2353112433304,
            longitude: 22.5528982268185
        ),
        moveOnly: true
    )
    @State var latitude: String = "51.2353112433304"
    @State var longitude: String = "22.5528982268185"
    @State var title: String = ""
    @State var subtitle: String = ""
    @State var alert: Bool = false
    @State var alertTitle: String = ""
    @State var alertMsg: String = ""
    
    var body: some View {
        VStack {
            MapView(myAnnotation: $myAnnotation)
                .frame(height: UIScreen.main.bounds.size.height * 0.4, alignment: .center)
                .alert(isPresented: $alert) {
                    Alert(
                        title: Text(alertTitle),
                        message: Text(alertMsg)
                    )
            }
            
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
                    if self.isCoordinateValid() {
                        self.move()
                    }
                })
                .frame(maxWidth: .infinity, alignment: .center)
                
                HStack {
                    Text("Title")
                    TextField("Title", text: $title)
                }
                HStack {
                    Text("Subtitle")
                    TextField("Subtitle", text: $subtitle)
                }
                Button("Add annotation", action: {
                    if self.isCoordinateValid() {
                        self.addAnnotation()
                    }
                })
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    private func isCoordinateValid() -> Bool {
        guard let latitudeAsDouble = Double(latitude) else {
            self.alertTitle = "Latitude"
            self.alertMsg = "Latitude must be of type Double"
            self.alert = true
            return false
        }
        guard let longitudeAsDouble = Double(longitude) else {
            self.alertTitle = "Longitude"
            self.alertMsg = "Longitude must be of type Double"
            self.alert = true
            return false
        }
        
        guard latitudeAsDouble >= -90 && latitudeAsDouble <= 90 else {
            self.alertTitle = "Latitude"
            self.alertMsg = "Latitude must be in range [-90, 90]"
            self.alert = true
            return false
        }
        guard longitudeAsDouble >= -180 && longitudeAsDouble <= 180 else {
            self.alertTitle = "Longitude"
            self.alertMsg = "Longitude must be in range [-180, 180]"
            self.alert = true
            return false
        }
        return true
    }
    
    private func move() {
        self.myAnnotation = MyAnnotation(
            title: title,
            subtitle: subtitle,
            coordinate: CLLocationCoordinate2D(
                latitude: Double(latitude)!,
                longitude: Double(longitude)!
            ),
            moveOnly: true
        )
    }
    
    private func addAnnotation() {
        self.myAnnotation = MyAnnotation(
            title: title,
            subtitle: subtitle,
            coordinate: CLLocationCoordinate2D(
                latitude: Double(latitude)!,
                longitude: Double(longitude)!
            )
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
