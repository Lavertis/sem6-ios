//
//  ContentView.swift
//  zad_9_3
//
//  Created by Rafał Kuźmiczuk on 07/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var location: CGPoint = CGPoint(
        x: UIScreen.main.bounds.size.width / 2,
        y: UIScreen.main.bounds.size.height / 2
    )
    
    var body: some View {
        Circle()
        .fill(Color.blue)
        .frame(width: 75, height: 75)
        .position(location)
        .gesture(DragGesture()
            .onChanged {
                self.location = $0.location
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
