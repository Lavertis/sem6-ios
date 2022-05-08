//
//  MapView.swift
//  zad_10_1
//
//  Created by Rafał Kuźmiczuk on 08/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable{
    @Binding var coordinate: CLLocationCoordinate2D
    @Binding var zoom: Double
    
    func makeUIView(context: Context) -> MKMapView {
        let myMap = MKMapView(frame: .zero)
        return myMap
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: zoom, longitudeDelta: zoom)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}
