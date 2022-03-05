//
//  ContentView.swift
//  zad_2_1
//
//  Created by Rafał Kuźmiczuk on 04/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let colours: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    var body: some View {
        ZStack {
            Text("Hello, World!")
            Text("Hello, Wssrld!")
            
            ForEach(0..<colours.count, id: \.self) { idx in
                Rectangle()
                    .fill(self.colours[idx])
                    .frame(width: 200, height: 200)
                    .offset(x: CGFloat(idx) * 10.0, y: CGFloat(idx) * 10.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
