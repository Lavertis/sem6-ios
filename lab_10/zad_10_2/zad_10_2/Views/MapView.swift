//
//  MapView.swift
//  zad_10_2
//
//  Created by Rafał Kuźmiczuk on 08/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var myAnnotation : MyAnnotation
    
    func makeUIView(context: Context) -> MKMapView {
        let myMap = MKMapView(frame: .zero)
        return myMap
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: myAnnotation.coordinate, span: span)
        uiView.setRegion(region, animated: true)
        if !myAnnotation.moveOnly {
            uiView.addAnnotation(myAnnotation.self)
        }
    }
}
