//
//  ContentView.swift
//  zad_9_2
//
//  Created by Rafał Kuźmiczuk on 07/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

let colors: [Color] = [Color.black, Color.red, Color.green, Color.blue, Color.orange, Color.pink, Color.purple, Color.yellow]

struct ContentView: View {
    @State var index: Int = 0
    
    var body: some View {
        let longPress = LongPressGesture()
            .onEnded { finished in
                self.index = self.index + 1
        }
        
        return Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(colors[index % colors.count])
            .gesture(longPress)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
