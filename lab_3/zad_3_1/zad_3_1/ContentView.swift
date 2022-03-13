
//
//  ContentView.swift
//  zad_3_1
//
//  Created by Rafał Kuźmiczuk on 13/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var clicks: Int = 0
    var body: some View {
        VStack {
            Text("Wciśnij przycisk")
            MyButton(clicks: $clicks)
            Text("Wciśnięto \(clicks) razy!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
